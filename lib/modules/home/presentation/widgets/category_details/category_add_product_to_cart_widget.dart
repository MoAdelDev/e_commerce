import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/category_details/category_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryAddProductToCardWidget extends StatelessWidget {
  final Product product;

  const CategoryAddProductToCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context
                .read<CategoryDetailsBloc>()
                .add(CategoryDetailsChangeCartEvent(product.id));
          },
          icon: Icon(
            MyApp.productCartQuantity[product.id] != 0
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
