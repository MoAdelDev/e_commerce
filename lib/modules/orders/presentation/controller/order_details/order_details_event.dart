part of 'order_details_bloc.dart';

abstract class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();
}

class OrderDetailsGetEvent extends OrderDetailsEvent {
  final int orderId;

  const OrderDetailsGetEvent(this.orderId);

  @override
  List<Object> get props => [orderId];
}
