import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/category_details/category_add_product_to_cart_widget.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/category_details/category_add_product_to_favorites_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/route/route_string.dart';
import '../../../../../core/route/screen_args.dart';
import 'category_product_data_widget.dart';
import 'category_product_image_widget.dart';

class CategoryProductWidget extends StatelessWidget {
  final Product product;

  const CategoryProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScreenArgs args = ScreenArgs.toProductDetails(product.id);
        Navigator.popAndPushNamed(context, RouteConst.productDetailsScreen,
            arguments: args);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryProductImageWidget(product: product),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryProductDataWidget(product: product),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CategoryAddProductToCardWidget(product: product),
                        const SizedBox(
                          width: 3.0,
                        ),
                        CategoryAddProductToFavoritesWidget(product: product),
                      ],
                    )
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
