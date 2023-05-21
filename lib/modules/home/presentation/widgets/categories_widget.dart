import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/theme/components/default_shimmer.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/home_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.categoriesState != RequestState.success) {
          return SizedBox(
            height: 100.0.h,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                height: 100.0.h,
                width: 100.0.w,
                child: const DefaultShimmer(),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 5.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
            ),
          );
        }
        return FadeInLeftBig(
          duration: const Duration(milliseconds: 2000),
          child: SizedBox(
            height: 100.0.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Category category = state.categories[index];
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    SizedBox(
                      height: 100.0.h,
                      width: 100.0.w,
                      child: CachedNetworkImage(
                        imageUrl: category.image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const DefaultShimmer(),
                        placeholder: (context, url) => const DefaultShimmer(),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 20.0.h,
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 5.0.w),
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
