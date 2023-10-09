import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/cart/cart_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/cart/cart_widget.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: BlocProvider<CartBloc>(
        create: (context) => CartBloc(sl(), sl(), sl())
          ..add(
            CartGetProductsCartEvent(),
          ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.productsCartState != RequestState.success) {
              return const LoadingWidget();
            }
            if (state.cart.products.isEmpty) {
              return Center(
                child: DefaultAnimatedText(
                    text: S.of(context).noProductsTitle,
                    textStyle: Theme.of(context).textTheme.titleLarge),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: DefaultScrollPhysics.defaultPhysics(),
                    itemCount: state.cart.products.length,
                    itemBuilder: (context, index) {
                      CartProduct product = state.cart.products[index];
                      return CartWidget(product: product);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: Colors.grey[400],
                            height: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultButton(
                    onPressed: () {
                      int totalItems = 0;
                      for (CartProduct product in state.cart.products) {
                        totalItems += product.quantity;
                      }
                      ScreenArgs args = ScreenArgs.toConfirmOrder(
                        totalItems,
                        state.cart.totalPrice.toStringAsFixed(2).toString(),
                        state.cart.products,
                      );
                      Navigator.pushNamed(context, RouteConst.orderConfirmationScreen,
                          arguments: args);
                    },
                    text:
                        '${S.of(context).checkoutTitle} ( EGP ${state.cart.totalPrice.toStringAsFixed(2)} )',
                    textStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
