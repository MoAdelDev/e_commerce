import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/theme/app_color/app_color_light.dart';
import 'package:e_commerce_app/core/theme/components/default_animation.dart';
import 'package:e_commerce_app/core/theme/components/default_shimmer.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/products/products_bloc.dart';
import '../controller/products/products_event.dart';
import '../controller/products/products_state.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        context.read<ProductsBloc>().add(HomeGetProductsEvent());
        if (state.productsState != RequestState.success) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 3.0,
            childAspectRatio: 1 / 1.68,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              DefaultShimmer(),
              DefaultShimmer(),
            ],
          );
        }
        return DefaultAnimation(
          animationDirection: AnimationDirection.up,
          child: Container(
            color: Colors.grey[300],
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3.0,
              childAspectRatio: 1 / 1.68,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                state.products.length,
                (index) => InkWell(
                  onTap: () {
                    // TODO : Navigate to product detail
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              SizedBox(
                                height: 180.h,
                                child: CachedNetworkImage(
                                  imageUrl: state.products[index].image,
                                  placeholder: (context, url) =>
                                      const DefaultShimmer(),
                                  errorWidget: (context, url, error) =>
                                      const DefaultShimmer(),
                                ),
                              ),
                              if (state.products[index].discount != 0)
                                Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0)
                                      .r,
                                  child: Text(
                                    'DISCOUNT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0.sp),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.products[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(height: 1.2),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          'EGP ${state.products[index].price}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColorLight.primaryColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          width: 5.0.w,
                                        ),
                                        if (state.products[index].discount != 0)
                                          Expanded(
                                            child: Text(
                                              'EGP ${state.products[index].oldPrice}',
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context.read<ProductsBloc>().add(
                                              HomeChangeFavoriteEvent(
                                                  state.products[index].id),
                                            );
                                      },
                                      icon: Icon(
                                        state.favoriteMap[
                                                    state.products[index].id] ??
                                                false
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
