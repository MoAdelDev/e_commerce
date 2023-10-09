import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_order_details_usecase.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  OrderDetailsBloc(this.getOrderDetailsUseCase) : super(const OrderDetailsState()) {
    on<OrderDetailsGetEvent>(_getOrderDetails);
  }



  FutureOr<void> _getOrderDetails(OrderDetailsGetEvent event, Emitter<OrderDetailsState> emit)async {
    emit(state.copyWith(orderDetailsState: RequestState.loading));
    final result = await getOrderDetailsUseCase(orderId: event.orderId);
    result.fold((error) {
      emit(state.copyWith(orderDetailsState: RequestState.error, orderDetailsError: error.message));
    }, (orderDetails) {
      emit(state.copyWith(orderDetailsState: RequestState.success, orderDetails: orderDetails));
    });
  }
}
