import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_product_details_usecase.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsBaseEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
      : super(const ProductDetailsState()) {
    on<ProductDetailsGetEvent>(_getProduct);
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
}
