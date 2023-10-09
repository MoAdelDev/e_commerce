part of 'orders_bloc.dart';

abstract class BaseOrdersEvent extends Equatable {
  const BaseOrdersEvent();
}

class OrdersGetEvent extends BaseOrdersEvent {
  const OrdersGetEvent();

  @override
  List<Object> get props => [];
}

class OrdersCancelOrderEvent extends BaseOrdersEvent {
  final int orderId;

  const OrdersCancelOrderEvent(this.orderId);

  @override
  List<Object> get props => [orderId];
}
