part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final List<Order> orders;
  final RequestState ordersState;
  final String ordersError;

  final String cancelOrderMsg;
  final RequestState cancelOrderState;
  final String cancelOrderError;

  const OrdersState({
    this.orders = const [],
    this.ordersState = RequestState.nothing,
    this.ordersError = '',
    this.cancelOrderMsg = '',
    this.cancelOrderState = RequestState.nothing,
    this.cancelOrderError = '',
  });

  OrdersState copyWith({
    List<Order>? orders,
    RequestState? ordersState,
    String? ordersError,
    String? cancelOrderMsg,
    RequestState? cancelOrderState,
    String? cancelOrderError,
  }) =>
      OrdersState(
        orders: orders ?? this.orders,
        ordersState: ordersState ?? this.ordersState,
        ordersError: ordersError ?? this.ordersError,
        cancelOrderMsg: cancelOrderMsg ?? this.cancelOrderMsg,
        cancelOrderState: cancelOrderState ?? this.cancelOrderState,
        cancelOrderError: cancelOrderError ?? this.cancelOrderError,
      );

  @override
  List<Object> get props => [
        orders,
        ordersState,
        ordersError,
        cancelOrderMsg,
        cancelOrderState,
        cancelOrderError,
      ];
}
