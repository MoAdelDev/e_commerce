import 'dart:async';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_banners_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/domain/entities/user.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/home_get_products_usecase.dart';
import '../../domain/usecases/home_get_user_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  final HomeGetProductsUseCase homeGetProductsUseCase;
  final HomeGetUserUseCase homeGetUserUseCase;
  final HomeGetBannersUseCase homeGetBannersUseCase;
  final HomeGetCategoriesUseCase homeGetCategoriesUseCase;

  HomeBloc(
    this.homeGetProductsUseCase,
    this.homeGetUserUseCase,
    this.homeGetBannersUseCase,
    this.homeGetCategoriesUseCase,
  ) : super(const HomeState()) {
    on<HomeGetProductsEvent>(_getProducts);
    on<HomeGetBannersEvent>(_getBanners);
    on<HomeGetCategoriesEvent>(_getCategories);
    on<HomeGetUserEvent>(_getUser);
  }

  FutureOr<void> _getProducts(
      HomeGetProductsEvent event, Emitter<HomeState> emit) async {
    final result = await homeGetProductsUseCase();

    result.fold(
      (error) => emit(
        state.copyWith(
          productsState: RequestState.error,
          productsError: error.message,
        ),
      ),
      (products) => emit(
        state.copyWith(
          products: products,
          productsState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getUser(
      HomeGetUserEvent event, Emitter<HomeState> emit) async {
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
      HomeGetCategoriesEvent event, Emitter<HomeState> emit) async {
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
      HomeGetBannersEvent event, Emitter<HomeState> emit) async {
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
}
