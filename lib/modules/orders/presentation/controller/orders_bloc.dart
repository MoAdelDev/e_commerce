import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_addresses_in_orders_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/validate_promo_codes_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/usecases/add_order_usecase.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<BaseOrdersEvent, OrdersState> {
  final GetAddressesInOrdersUseCase getAddressesInOrderUseCase;
  final ValidatePromoCodesUseCase validatePromoCodesUseCase;
  final AddOrderUseCase addOrderUseCase;

  OrdersBloc(this.getAddressesInOrderUseCase, this.validatePromoCodesUseCase,
      this.addOrderUseCase)
      : super(const OrdersState()) {
    on<OrdersValidatePromoCodesEvent>(_validatePromoCode);
    on<OrdersGetAddressesEvent>(_getAddresses);
    on<OrdersChangeAddressEvent>(_changeAddress);
    on<OrdersAddOrderEvent>(_addOrder);
  }

  FutureOr<void> _getAddresses(
      OrdersGetAddressesEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(addressesState: RequestState.loading));
    final result = await getAddressesInOrderUseCase();
    result.fold(
      (error) => emit(
        state.copyWith(
          addressesState: RequestState.error,
          addressesError: error.message,
        ),
      ),
      (addresses) {
        emit(
          state.copyWith(
            addressesState: RequestState.success,
            addresses: addresses,
            addressId: addresses.isNotEmpty ? addresses[0].id : 0
          ),
        );
      }
    );
  }

  FutureOr<void> _validatePromoCode(
      OrdersValidatePromoCodesEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(validatePromoCodesState: RequestState.loading));
    final result = await validatePromoCodesUseCase(code: event.code);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          validatePromoCodesState: RequestState.error,
          validatePromoCodesError: error.message,
        ),
      );
    }, (message) {
      showToast(msg: message, requestState: RequestState.success);
      emit(
        state.copyWith(
          validatePromoCodesState: RequestState.success,
          validatePromoCodesMsg: message,
        ),
      );
    });
  }

  FutureOr<void> _changeAddress(
      OrdersChangeAddressEvent event, Emitter<OrdersState> emit) {
    emit(state.copyWith(
        addressId: event.addressId, addressSelected: event.addressSelected));
  }

  FutureOr<void> _addOrder(
      OrdersAddOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(addOrderState: RequestState.loading));
    final result = await addOrderUseCase(addressId: event.addressId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          addOrderState: RequestState.error,
          addOrderError: error.message,
        ),
      );
    }, (message) {
      MyApp.productCartQuantity.forEach((key, value) {
        MyApp.productCartQuantity[key] = 0;
      });
      showToast(msg: message, requestState: RequestState.success);
      emit(
        state.copyWith(
          addOrderState: RequestState.success,
          addOrderMsg: message,
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
          event.context, RouteConst.homeScreen, (route) => false);
    });
  }
}
