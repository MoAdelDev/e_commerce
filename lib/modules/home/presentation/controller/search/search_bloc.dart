import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/modules/home/domain/entities/search.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/search_products_usecase.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<BaseSearchEvent, SearchState> {
  final SearchProductsUseCase searchProductsUseCase;

  SearchBloc(this.searchProductsUseCase) : super(const SearchState()) {
    on<SearchProductsEvent>(_searchProducts);
  }

  FutureOr<void> _searchProducts(
      SearchProductsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(productsState: RequestState.loading));
    final result = await searchProductsUseCase(query: event.query);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          productsState: RequestState.error, productsError: error.message));
    }, (products) {
      emit(state.copyWith(products: const []));
      emit(state.copyWith(
          productsState: RequestState.success, products: products));
    });
  }
}
