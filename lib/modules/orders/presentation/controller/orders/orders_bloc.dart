import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/cancel_order_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_orders_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/order.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<BaseOrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  OrdersBloc(
    this.getOrdersUseCase,
    this.cancelOrderUseCase,
  ) : super(const OrdersState()) {
    on<OrdersGetEvent>(_getOrders);
    on<OrdersCancelOrderEvent>(_cancelOrder);
  }

  FutureOr<void> _getOrders(
      OrdersGetEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(ordersState: RequestState.loading));

    final result = await getOrdersUseCase();
    result.fold((error) {
      emit(state.copyWith(
          ordersState: RequestState.error, ordersError: error.message));
    }, (orders) {
      emit(state.copyWith(orders: orders, ordersState: RequestState.success));
    });
  }

  FutureOr<void> _cancelOrder(
      OrdersCancelOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(cancelOrderState: RequestState.loading));
    final result = await cancelOrderUseCase(orderId: event.orderId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          cancelOrderState: RequestState.error,
          cancelOrderError: error.message));
    }, (message) {
      showToast(msg: message, requestState: RequestState.success);
      add(const OrdersGetEvent());
      emit(state.copyWith(
          cancelOrderState: RequestState.success, cancelOrderMsg: message));
    });
  }
}
