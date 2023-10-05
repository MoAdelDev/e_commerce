import 'dart:async';

import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/delete_product_from_carts_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/update_cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartBaseEvent, CartState> {
  final GetProductsCartUseCase getProductsCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  CartBloc(
    this.getProductsCartUseCase,
    this.updateCartUseCase,
    this.deleteProductFromCartUseCase,
  ) : super(const CartState()) {
    on<CartGetProductsCartEvent>(_getProductsCart);
    on<CartUpdateProductsCartEvent>(_updateCart);
    on<CartDeleteProductFromCartEvent>(_deleteProductFromCart);
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
      (cart) => emit(
        state.copyWith(productsCartState: RequestState.success, cart: cart),
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

  FutureOr<void> _deleteProductFromCart(
      CartDeleteProductFromCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      deleteState: RequestState.loading,
    ));
    final result = await deleteProductFromCartUseCase(cartId: event.cartId);
    result.fold((e) {
      emit(state.copyWith(
          deleteState: RequestState.error, deleteError: e.message));
      showToast(msg: e.message, requestState: RequestState.error);
    }, (deleteMEssage) {
      add(CartGetProductsCartEvent());
      MyApp.productCartQuantity[event.productId] = 0;
      emit(state.copyWith(
          deleteState: RequestState.error, deleteCartState: deleteMEssage));
      showToast(msg: deleteMEssage, requestState: RequestState.success);
    });
  }
}
