import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/components/default_animation.dart';
import '../../../../../core/style/components/default_shimmer.dart';
import '../../controller/home/home_bloc.dart';
import '../../controller/home/home_event.dart';
import '../../controller/home/home_state.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.productsState != RequestState.success &&
            state.cartsState != RequestState.success) {
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
              children: List.generate(state.products.length, (index) {
                return InkWell(
                  onTap: () {
                    // Navigate to product detail
                    ScreenArgs args =
                        ScreenArgs.toProductDetails(state.products[index].id);
                    Navigator.pushNamed(
                        context, RouteConst.productDetailsScreen,
                        arguments: args);
                  },
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                SizedBox(
                                  height: 180,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: Text(
                                      '- ${state.products[index].discount} %',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.products[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'EGP ${state.products[index].price}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        if (state.products[index].discount != 0)
                                          Expanded(
                                            child: Text(
                                              '${state.products[index].oldPrice}',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 12.0,
                                                      color: Colors.grey),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<HomeBloc>().add(
                                            HomeChangeFavoriteEvent(
                                                state.products[index].id),
                                          );
                                    },
                                    icon: Icon(
                                      AppData.favoriteMap[
                                              state.products[index].id]!
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
