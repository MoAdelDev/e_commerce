import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/components/default_animation.dart';
import '../../../../core/style/components/default_shimmer.dart';
import '../controller/products/products_bloc.dart';
import '../controller/products/products_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.categoriesState != RequestState.success) {
            return ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                      height: 100.0.h,
                      width: double.infinity,
                      child: const DefaultShimmer(),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                itemCount: 30);
          }
          return DefaultAnimation(
            animationDirection: AnimationDirection.up,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Category category = state.categories[index];
                  return Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: category.image,
                        height: 100.0.h,
                        width: 100.0.w,
                        placeholder: (context, url) => const DefaultShimmer(),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Expanded(
                        child: Text(
                          category.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ).r,
                      child: Divider(
                        height: 1.0.h,
                        color: Colors.grey[300],
                      ),
                    ),
                itemCount: state.categories.length),
          );
        },
      ),
    );
  }
}
