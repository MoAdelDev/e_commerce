import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/cart/cart_product_details_widget.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/cart/increment_decrement_widget.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/cart/remove_product_from_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cart/cart_bloc.dart';

class CartWidget extends StatelessWidget {
  final CartProduct product;

  const CartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            ScreenArgs args = ScreenArgs.toProductDetails(product.productId);
            Navigator.pushNamed(context, RouteConst.productDetailsScreen,
                arguments: args);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartProductDetailsWidget(product: product),
                const SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [
                    IncrementAndDecrementWidget(product: product),
                    const Spacer(),
                    RemoveProductFromCartWidget(product: product),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
