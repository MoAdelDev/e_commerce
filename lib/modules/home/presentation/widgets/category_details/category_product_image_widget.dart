import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/components/default_shimmer.dart';

class CategoryProductImageWidget extends StatelessWidget {
  final Product product;

  const CategoryProductImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: CachedNetworkImage(
            imageUrl: product.image,
            errorWidget: (context, url, error) => const DefaultShimmer(),
            placeholder: (context, url) => const DefaultShimmer(),
          ),
        ),
        if (product.discount != 0)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              child: Center(
                child: Text(
                  '- ${product.discount} %',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
