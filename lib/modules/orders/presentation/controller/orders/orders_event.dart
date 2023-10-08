part of 'orders_bloc.dart';

abstract class BaseOrdersEvent extends Equatable {
  const BaseOrdersEvent();
}

class OrdersGetEvent extends BaseOrdersEvent {
  const OrdersGetEvent();

  @override
  List<Object> get props => [];
}
