import 'dart:async';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/add_product_to_cart_usecase.dart';
import '../../../domain/usecases/get_product_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsBaseEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final AddProductToCartUseCase addProductToCartUseCase;

  ProductDetailsBloc(
    this.getProductDetailsUseCase,
    this.addProductToCartUseCase,
  ) : super(const ProductDetailsState()) {
    on<ProductDetailsGetEvent>(_getProduct);
    on<ProductDetailsAddProductToCartEvent>(_addProductToCart);
    on<ProductDetailsChangeTopConstraintEvent>(_changeTopContsraint);
  }

  FutureOr<void> _getProduct(
      ProductDetailsGetEvent event, Emitter<ProductDetailsState> emit) async {
    final result = await getProductDetailsUseCase(productId: event.productId);
    result.fold(
      (error) => emit(
        state.copyWith(productState: RequestState.error),
      ),
      (product) => emit(
        state.copyWith(
          product: product,
          productState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _changeTopContsraint(
      ProductDetailsChangeTopConstraintEvent event,
      Emitter<ProductDetailsState> emit) {
    emit(state.copyWith(top: event.constraints.biggest.height));
  }

  FutureOr<void> _addProductToCart(ProductDetailsAddProductToCartEvent event,
      Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(addProductToCartState: RequestState.loading));
    final result = await addProductToCartUseCase(productId: event.productId);
    result.fold((error) {
      showToast(
          msg: 'Failed to add product to cart, try again',
          requestState: RequestState.error);
      emit(
        state.copyWith(
          addProductToCartState: RequestState.error,
          addProductToCartError: error.message,
        ),
      );
    }, (cartMessage) {
      MyApp.productCartQuantity[event.productId] =
          (MyApp.productCartQuantity[event.productId] ?? 0) + 1;
      emit(state.copyWith(addProductToCartState: RequestState.success));
      showToast(msg: cartMessage, requestState: RequestState.success);
    });
  }
}
