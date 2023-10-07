import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/colors.dart';
import '../../../../../core/style/components/default_progress_indicator.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../main.dart';

class IncrementAndDecrementWidget extends StatelessWidget {
  final CartProduct product;

  const IncrementAndDecrementWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: 30.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: MyApp.language == Language.arabic.name
                    ? const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
              ),
              child: MaterialButton(
                onPressed:isLoading(state)
                    ? null
                    : () {
                        if( product.quantity == 1 ) {
                          context.read<CartBloc>().add(
                            CartDeleteProductFromCartEvent(
                              product.id,
                              product.productId,
                            ),
                          );
                        }
                        else{
                          context.read<CartBloc>().add(
                            CartUpdateProductsCartEvent(
                              product.id,
                              product.quantity - 1,
                              product.productId,
                            ),
                          );
                        }

                      },
                child: Text(
                  '-',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColorLight.primaryColor)),
              child: Center(
                child: isLoading(state)
                    ? const DefaultProgressIndicator(
                        size: 25,
                      )
                    : Text(
                        '${product.quantity}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: 30.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: MyApp.language == Language.arabic.name
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
              ),
              child: MaterialButton(
                onPressed: isLoading(state)
                    ? null
                    : () {
                        context.read<CartBloc>().add(
                              CartUpdateProductsCartEvent(product.id,
                                  product.quantity + 1, product.productId),
                            );
                      },
                child: Text(
                  '+',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool isLoading(CartState state) {
    if (state.updateState == RequestState.loading ||
        state.deleteState == RequestState.loading) {
      return true;
    }
    return false;
  }
}
