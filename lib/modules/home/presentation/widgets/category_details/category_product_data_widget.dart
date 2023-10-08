import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:flutter/material.dart';

class CategoryProductDataWidget extends StatelessWidget {
  final Product product;

  const CategoryProductDataWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: Theme.of(context).textTheme.bodySmall),
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
    );
  }
}
