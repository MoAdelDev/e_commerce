import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/home/banners_widget.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/home/products_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SingleChildScrollView(
        physics: DefaultScrollPhysics.defaultPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannersWidget(),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    S.of(context).productsTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const ProductsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
