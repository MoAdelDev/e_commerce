import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/components/default_shimmer.dart';

class CartProductDetailsWidget extends StatelessWidget {
  final CartProduct product;
  const CartProductDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: CachedNetworkImage(
            imageUrl: product.image,
            errorWidget: (context, url, error) =>
            const DefaultShimmer(),
            placeholder: (context, url) => const DefaultShimmer(),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text('EGP ${product.price.toString()}',
                        style:
                        Theme.of(context).textTheme.bodySmall),
                    const SizedBox(
                      width: 5.0,
                    ),
                    if (product.discount != 0)
                      Text(
                        'EGP ${product.oldPrice.toString()}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
