import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveProductFromCartWidget extends StatelessWidget {
  final CartProduct product;
  const RemoveProductFromCartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    return MaterialButton(
      onPressed: () {
        // remove product from cart
        context.read<CartBloc>().add(
          CartDeleteProductFromCartEvent(
              product.id, product.productId),
        );
      },
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            S.of(context).removeTitle,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  },
);
  }
}
