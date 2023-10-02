import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_shimmer.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/favorites/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<FavoritesBloc>(
        create: (context) => FavoritesBloc(sl(), sl())..add(FavoritesGetEvent()),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state.favoritesState != RequestState.success) {
              return const Center(child: DefaultSpinKit());
            }
            if (state.favorites.isEmpty) {
              return Center(
                  child: DefaultAnimatedText(
                      text:  S.of(context).noProductsTitle,
                      textStyle: Theme.of(context).textTheme.titleLarge));
            }
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Favorite favorite = state.favorites[index];
                  return InkWell(
                    onTap: (){
                      ScreenArgs args = ScreenArgs.toProductDetails(favorite.productId);
                      Navigator.pushNamed(context, RouteConst.productDetailsScreen, arguments: args);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0).r,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100.0.h,
                                width: 100.0.w,
                                child: CachedNetworkImage(
                                  imageUrl: favorite.image,
                                  errorWidget: (context, url, error) =>
                                      const DefaultShimmer(),
                                  placeholder: (context, url) =>
                                      const DefaultShimmer(),
                                ),
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
                                        favorite.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 8.0.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP ${favorite.price.toString()}',
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
                                          if (favorite.discount != 0)
                                            Text(
                                              'EGP ${favorite.oldPrice.toString()}',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey,
                                                  decoration:
                                                      TextDecoration.lineThrough),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: MaterialButton(
                              onPressed: () {
                                // remove favorite
                                context.read<FavoritesBloc>().add(
                                      FavoritesRemoveProductEvent(
                                        favorite.id,
                                        favorite.productId,
                                      ),
                                    );
                              },
                              color: Colors.white,
                              elevation: 0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  SizedBox(
                                    width: 10.0.w,
                                  ),
                                  Text(
                                    S.of(context).removeTitle,
                                    style: TextStyle(
                                      fontSize: 16.0.sp,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
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
                itemCount: state.favorites.length);
          },
        ),
      ),
    );
  }
}
