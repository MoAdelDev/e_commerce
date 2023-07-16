import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/product_details/product_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/style/components/default_shimmer.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ScreenArgs screenArgs;

  const ProductDetailsScreen({super.key, required this.screenArgs});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  buildSliverAppBar(context, ProductDetailsState state) {
    var imageHeight = MediaQuery.sizeOf(context).height / 2.0.h;

    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height / 3.h,
      stretch: true,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          context
              .read<ProductDetailsBloc>()
              .add(ProductDetailsChangeTopConstraintEvent(constraints));
          return FlexibleSpaceBar(
              background: Stack(children: [
            CarouselSlider(
              items: state.product?.images
                  .map(
                    (e) => Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: imageHeight,
                      child: CachedNetworkImage(
                        imageUrl: e,
                        height: imageHeight,
                        placeholder: (context, url) => const DefaultShimmer(),
                        errorWidget: (context, url, error) =>
                            const DefaultShimmer(),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: imageHeight,
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
            if (state.product?.discount != 0)
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0)
                      .r,
                  child: Text(
                    'DISCOUNT',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              )
          ]));
        },
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: state.top == MediaQuery.paddingOf(context).top + kToolbarHeight
              ? Colors.white
              : Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<ProductDetailsBloc>(
          create: (context) =>
              sl()..add(ProductDetailsGetEvent(widget.screenArgs.productId)),
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              if (state.productState == RequestState.loading) {
                return const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: DefaultSpinKit(),
                  ),
                );
              } else if (state.productState == RequestState.error) {
                return SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: DefaultAnimatedText(
                      text: 'Failed to load data, try again',
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        buildSliverAppBar(context, state),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.product?.name ?? '',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      overflow: TextOverflow.visible,
                                      maxLines: null,
                                    ),
                                    SizedBox(
                                      height: 8.0.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'EGP ${state.product?.price}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 3.0.w,
                                        ),
                                        if (state.product?.discount != 0)
                                          Text(
                                            'EGP ${state.product?.oldPrice}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Text(
                                  'Description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ),
                              SizedBox(height: 10.0.w),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  state.product?.description ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 300,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  if (MyApp.productCartQuantity[state.product?.id] == 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ConditionalBuilder(
                        condition:
                            state.addProductToCartState != RequestState.loading,
                        builder: (context) => DefaultButton(
                            onPressed: () {
                              context.read<ProductDetailsBloc>().add(
                                  ProductDetailsAddOrRemoveProductToCartEvent(
                                      state.product?.id ?? 0));
                            },
                            text: 'Add to cart'),
                        fallback: (context) => const DefaultSpinKit(),
                      ),
                    ),
                  if (MyApp.productCartQuantity[state.product?.id] != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ConditionalBuilder(
                        condition:
                            state.addProductToCartState != RequestState.loading,
                        builder: (context) => DefaultButton(
                            onPressed: () {
                              context.read<ProductDetailsBloc>().add(
                                  ProductDetailsAddOrRemoveProductToCartEvent(
                                      state.product?.id ?? 0));
                            },
                            text: 'Remove from cart'),
                        fallback: (context) => const DefaultSpinKit(),
                      ),
                    ),
                  SizedBox(
                    height: 5.0.h,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
