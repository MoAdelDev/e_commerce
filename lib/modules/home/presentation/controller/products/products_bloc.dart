import 'dart:async';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_banners_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_categories_usecase.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/products/products_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/change_favorite_usecase.dart';
import '../../../domain/usecases/get_products_usecase.dart';
import '../../../domain/usecases/get_user_usecase.dart';

class ProductsBloc extends Bloc<ProductsBaseEvent, ProductsState> {
  final GetProductsUseCase homeGetProductsUseCase;
  final GetUserUseCase homeGetUserUseCase;
  final GetBannersUseCase homeGetBannersUseCase;
  final GetCategoriesUseCase homeGetCategoriesUseCase;
  final ChangeFavoriteUseCase homeChangeFavoriteUseCase;

  ProductsBloc(
    this.homeGetProductsUseCase,
    this.homeGetUserUseCase,
    this.homeGetBannersUseCase,
    this.homeGetCategoriesUseCase,
    this.homeChangeFavoriteUseCase,
  ) : super(const ProductsState()) {
    on<HomeChangeBottomNavIndexEvent>(_changeCurrentIndex);
    on<HomeGetProductsEvent>(_getProducts);
    on<HomeGetBannersEvent>(_getBanners);
    on<HomeGetCategoriesEvent>(_getCategories);
    on<HomeGetUserEvent>(_getUser);
    on<HomeChangeFavoriteEvent>(_changeFavorite);
  }

  FutureOr<void> _getProducts(
      HomeGetProductsEvent event, Emitter<ProductsState> emit) async {
    final result = await homeGetProductsUseCase();

    result.fold(
        (error) => emit(
              state.copyWith(
                productsState: RequestState.error,
                productsError: error.message,
              ),
            ), (products) {
      // fill favorite map
      Map<int, bool> favoritesData = {};
      for (var product in products) {
        favoritesData.addAll(
          {product.id: product.inFavorites},
        );
      }
      emit(
        state.copyWith(
          products: products,
          favoriteMap: favoritesData,
          productsState: RequestState.success,
        ),
      );
    });
  }

  FutureOr<void> _getUser(
      HomeGetUserEvent event, Emitter<ProductsState> emit) async {
    final result = await homeGetUserUseCase();
    result.fold(
        (error) => emit(
              state.copyWith(
                userState: RequestState.error,
                userError: error.message,
              ),
            ), (userData) {
      user = userData;
      emit(
        state.copyWith(
          user: userData,
          userState: RequestState.success,
        ),
      );
    });
  }

  FutureOr<void> _getCategories(
      HomeGetCategoriesEvent event, Emitter<ProductsState> emit) async {
    final result = await homeGetCategoriesUseCase();
    result.fold(
      (e) => emit(
        state.copyWith(
          categoriesError: e.message,
          categoriesState: RequestState.error,
        ),
      ),
      (categoriesData) => emit(
        state.copyWith(
          categories: categoriesData,
          categoriesState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getBanners(
      HomeGetBannersEvent event, Emitter<ProductsState> emit) async {
    final result = await homeGetBannersUseCase();
    result.fold(
      (e) => emit(
        state.copyWith(
          bannersError: e.message,
          bannersState: RequestState.error,
        ),
      ),
      (bannerData) => emit(
        state.copyWith(
          banners: bannerData,
          bannersState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _changeFavorite(
      HomeChangeFavoriteEvent event, Emitter<ProductsState> emit) async {
    state.favoriteMap[event.productId] = !state.favoriteMap[event.productId]!;
    emit(state.copyWith(favoriteState: RequestState.loading));
    final result = await homeChangeFavoriteUseCase(productId: event.productId);
    result.fold(
      (error) {
        state.favoriteMap[event.productId] =
            !state.favoriteMap[event.productId]!;
        emit(
          state.copyWith(
            favoriteState: RequestState.error,
            favoriteError: error.message,
          ),
        );
      },
      (favorite) => emit(
        state.copyWith(
          favorite: favorite,
          favoriteState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _changeCurrentIndex(
      HomeChangeBottomNavIndexEvent event, Emitter<ProductsState> emit) {
    emit(
      state.copyWith(
        currentIndex: event.index,
      ),
    );
  }
}
