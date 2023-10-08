import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_orders_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/order.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<BaseOrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;

  OrdersBloc(this.getOrdersUseCase) : super(const OrdersState()) {
    on<OrdersGetEvent>(_getOrders);
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
}
