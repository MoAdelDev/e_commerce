import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/modules/home/domain/entities/search.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/components/default_shimmer.dart';

class SearchProductWidget extends StatelessWidget {
  final Search search;

  const SearchProductWidget({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScreenArgs args = ScreenArgs.toProductDetails(search.id);
        Navigator.popAndPushNamed(context, RouteConst.productDetailsScreen,
            arguments: args);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: CachedNetworkImage(
                    imageUrl: search.image,
                    errorWidget: (context, url, error) =>
                        const DefaultShimmer(),
                    placeholder: (context, url) => const DefaultShimmer(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      search.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Text('EGP ${search.price.toString()}',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
