import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/change_favorite_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_category_details_usecase.dart';
import 'package:equatable/equatable.dart';
part 'category_details_event.dart';
part 'category_details_state.dart';

class CategoryDetailsBloc
    extends Bloc<CategoryDetailsBaseEvent, CategoryDetailsState> {
  final GetCategoryDetailsUseCase getCategoryDetailsUseCase;
  final ChangeFavoriteUseCase changeFavoriteUseCase;
  final AddProductToCartUseCase addProductToCartUseCase;
  CategoryDetailsBloc(
    this.getCategoryDetailsUseCase,
    this.changeFavoriteUseCase,
    this.addProductToCartUseCase,
  ) : super(const CategoryDetailsState()) {
    on<CategoryDetailsGetEvent>(_getProducts);
    on<CatgeoryDetailsChangeFavoritesEvent>(_changeFavorites);
    on<CategoryDetailsCahngeCartEvent>(_changeCart);
  }

  FutureOr<void> _getProducts(
      CategoryDetailsGetEvent event, Emitter<CategoryDetailsState> emit) async {
    final result =
        await getCategoryDetailsUseCase(categoryId: event.categoryId);

    result.fold(
      (error) => emit(
        state.copyWith(
            productsError: error.message, productsState: RequestState.error),
      ),
      (products) => emit(state.copyWith(
          products: products, productsState: RequestState.success)),
    );
  }

  FutureOr<void> _changeFavorites(CatgeoryDetailsChangeFavoritesEvent event,
      Emitter<CategoryDetailsState> emit) async {
    emit(
      state.copyWith(
        favoriteState: RequestState.loading,
      ),
    );

    final result = await changeFavoriteUseCase(productId: event.productId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          favoriteState: RequestState.error,
          favoriteError: error.message,
        ),
      );
    }, (favoriteMessage) {
      MyApp.favoriteMap[event.productId] = !MyApp.favoriteMap[event.productId]!;
      emit(state.copyWith(
          favoriteMessage: favoriteMessage,
          favoriteState: RequestState.success));
    });
  }

  FutureOr<void> _changeCart(CategoryDetailsCahngeCartEvent event,
      Emitter<CategoryDetailsState> emit) async {
    emit(state.copyWith(cartState: RequestState.loading));
    final result = await addProductToCartUseCase(productId: event.productId);

    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          cartState: RequestState.error, cartError: error.message));
    }, (cartMessage) {
      if (MyApp.productCartQuantity[event.productId] != 0) {
        MyApp.productCartQuantity[event.productId] = 0;
      } else {
        MyApp.productCartQuantity[event.productId] = 1;
      }

      emit(state.copyWith(
          cartState: RequestState.success, cartMessage: cartMessage));
    });
  }
}
