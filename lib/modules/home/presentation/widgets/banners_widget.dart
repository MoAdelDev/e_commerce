import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/style/components/default_animation.dart';
import '../../../../core/style/components/default_shimmer.dart';
import '../controller/home/home_state.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        double bannerHeight = MediaQuery.of(context).size.height * 1 / 3;
        if (state.bannersState != RequestState.success) {
          return SizedBox(
            height: bannerHeight,
            child: const DefaultShimmer(),
          );
        }
        return DefaultAnimation(
            animationDirection: AnimationDirection.down,
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
            ));
      },
    );
  }
}
