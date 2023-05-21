import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/theme/components/default_shimmer.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        double bannerHeight = MediaQuery.of(context).size.height * 1 / 3.h;
        if (state.bannersState != RequestState.success) {
          return SizedBox(
            height: bannerHeight,
            child: const DefaultShimmer(),
          );
        }
        return FadeIn(
          duration: const Duration(milliseconds: 800),
          child: CarouselSlider(
            items: state.banners
                .map(
                  (e) => CachedNetworkImage(
                    imageUrl: e.image,
                    height: bannerHeight,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const DefaultShimmer(),
                    errorWidget: (context, url, error) =>
                        const DefaultShimmer(),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: bannerHeight,
              initialPage: 0,
              reverse: false,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
