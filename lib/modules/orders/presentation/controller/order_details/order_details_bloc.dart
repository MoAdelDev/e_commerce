import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/cancel_order_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/toasts.dart';
import '../../../domain/usecases/get_order_details_usecase.dart';

part 'order_details_event.dart';

part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  OrderDetailsBloc(
    this.getOrderDetailsUseCase,
    this.cancelOrderUseCase,
  ) : super(const OrderDetailsState()) {
    on<OrderDetailsGetEvent>(_getOrderDetails);
    on<OrderDetailsCancelOrderEvent>(_cancelOrder);
  }

  FutureOr<void> _getOrderDetails(
      OrderDetailsGetEvent event, Emitter<OrderDetailsState> emit) async {
    emit(state.copyWith(orderDetailsState: RequestState.loading));
    final result = await getOrderDetailsUseCase(orderId: event.orderId);
    result.fold((error) {
      emit(state.copyWith(
          orderDetailsState: RequestState.error,
          orderDetailsError: error.message));
    }, (orderDetails) {
      emit(state.copyWith(
          orderDetailsState: RequestState.success, orderDetails: orderDetails));
    });
  }

  FutureOr<void> _cancelOrder(OrderDetailsCancelOrderEvent event,
      Emitter<OrderDetailsState> emit) async {
    emit(state.copyWith(cancelOrderState: RequestState.loading));
    final result = await cancelOrderUseCase(orderId: event.orderId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          cancelOrderState: RequestState.error,
          cancelOrderError: error.message));
    }, (message) {
      showToast(msg: message, requestState: RequestState.success);
      add(OrderDetailsGetEvent(event.orderId));
      emit(state.copyWith(
          cancelOrderState: RequestState.success, cancelOrderMsg: message));
    });
  }
}
