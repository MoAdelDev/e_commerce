import 'dart:async';

import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/update_cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartBaseEvent, CartState> {
  final GetProductsCartUseCase getProductsCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  CartBloc(this.getProductsCartUseCase, this.updateCartUseCase)
      : super(const CartState()) {
    on<CartGetProductsCartEvent>(_getProductsCart);
    on<CartUpdateProductsCartEvent>(_updateCart);
  }

  FutureOr<void> _getProductsCart(
      CartGetProductsCartEvent event, Emitter<CartState> emit) async {
    emit(
      state.copyWith(
        updateState: RequestState.loading,
      ),
    );
    final result = await getProductsCartUseCase();
    result.fold(
      (error) => emit(
        state.copyWith(
          cartError: error.message,
          productsCartState: RequestState.error,
        ),
      ),
      (productsCart) => emit(
        state.copyWith(
            productsCartState: RequestState.success,
            productsCart: productsCart),
      ),
    );
    emit(
      state.copyWith(
        updateState: RequestState.nothing,
      ),
    );
  }

  FutureOr<void> _updateCart(
      CartUpdateProductsCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      updateState: RequestState.loading,
    ));
    final result =
        await updateCartUseCase(cartId: event.cartId, quantity: event.quantity);
    result.fold((e) {
      emit(state.copyWith(
        updateError: e.message,
        updateState: RequestState.success,
      ));
      showToast(msg: e.message, requestState: RequestState.error);
    }, (cartMessage) {
      add(CartGetProductsCartEvent());
      MyApp.productCartQuantity[event.productId] = event.quantity;
      emit(state.copyWith(
        updateCartState: cartMessage,
        updateState: RequestState.success,
      ));
      showToast(msg: cartMessage, requestState: RequestState.success);
    });
  }
}
