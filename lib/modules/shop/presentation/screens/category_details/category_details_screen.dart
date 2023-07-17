import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/category_details/category_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/style/components/default_shimmer.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final ScreenArgs screenArgs;
  const CategoryDetailsScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(screenArgs.categoryName),
        ),
        body: BlocProvider<CategoryDetailsBloc>(
          create: (context) =>
              sl()..add(CategoryDetailsGetEvent(screenArgs.categoryId)),
          child: BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
            builder: (context, state) {
              if (state.productsState != RequestState.success) {
                return const Center(
                  child: DefaultSpinKit(),
                );
              }

              if (state.products.isEmpty) {
                return Center(
                  child: DefaultAnimatedText(
                      text: 'No Products yet',
                      textStyle: Theme.of(context).textTheme.titleMedium),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  Product product = state.products[index];
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0).r,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 100.0.h,
                                width: 100.0.w,
                                child: CachedNetworkImage(
                                  imageUrl: product.image,
                                  errorWidget: (context, url, error) =>
                                      const DefaultShimmer(),
                                  placeholder: (context, url) =>
                                      const DefaultShimmer(),
                                ),
                              ),
                              if (product.discount != 0)
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 3.0)
                                        .r,
                                    child: Center(
                                      child: Text(
                                        'DISCOUNT',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0)
                                  .r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'EGP ${product.price.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 5.0.w,
                                      ),
                                      if (product.discount != 0)
                                        Text(
                                          'EGP ${product.oldPrice.toString()}',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<CategoryDetailsBloc>()
                                              .add(
                                                  CategoryDetailsCahngeCartEvent(
                                                      product.id));
                                        },
                                        icon: Icon(
                                          MyApp.productCartQuantity[state
                                                      .products[index].id] !=
                                                  0
                                              ? Icons.shopping_cart
                                              : Icons.shopping_cart_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.0.w,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<CategoryDetailsBloc>().add(
                                              CatgeoryDetailsChangeFavoritesEvent(
                                                  product.id));
                                        },
                                        icon: Icon(
                                          MyApp.favoriteMap[
                                                  state.products[index].id]!
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                  child: SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.grey[400],
                      height: 1,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
