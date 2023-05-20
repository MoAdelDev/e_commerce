import 'dart:async';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/domain/entities/user.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/home_get_products_usecase.dart';
import '../../domain/usecases/home_get_user_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  final HomeGetProductsUseCase homeGetProductsUseCase;
  final HomeGetUserUseCase homeGetUserUseCase;

  HomeBloc(
    this.homeGetProductsUseCase,
    this.homeGetUserUseCase,
  ) : super(const HomeState()) {
    on<HomeGetProductsEvent>(_getProducts);
    on<HomeGetUserEvent>(_getUser);
  }

  FutureOr<void> _getProducts(
      HomeGetProductsEvent event, Emitter<HomeState> emit) async {
    final result = await homeGetProductsUseCase.getProducts();

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
    final result = await homeGetUserUseCase.getUser();
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
}
