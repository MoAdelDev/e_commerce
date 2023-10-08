part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final List<Order> orders;
  final RequestState ordersState;
  final String ordersError;

  const OrdersState({
    this.orders = const [],
    this.ordersState = RequestState.nothing,
    this.ordersError = '',
  });

  OrdersState copyWith({
    List<Order>? orders,
    RequestState? ordersState,
    String? ordersError,
  }) =>
      OrdersState(
        orders: orders ?? this.orders,
        ordersState: ordersState ?? this.ordersState,
        ordersError: ordersError ?? this.ordersError,
      );

  @override
  List<Object> get props => [
        orders,
        ordersState,
        ordersError,
      ];
}
