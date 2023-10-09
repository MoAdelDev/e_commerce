part of 'order_details_bloc.dart';

class OrderDetailsState extends Equatable {
  final OrderDetails? orderDetails;
  final RequestState orderDetailsState;
  final String orderDetailsError;

  const OrderDetailsState({
    this.orderDetails,
    this.orderDetailsState = RequestState.nothing,
    this.orderDetailsError = '',
  });

  OrderDetailsState copyWith({
    OrderDetails? orderDetails,
    RequestState? orderDetailsState,
    String? orderDetailsError,
  }) =>
      OrderDetailsState(
        orderDetails: orderDetails ?? this.orderDetails,
        orderDetailsState: orderDetailsState ?? this.orderDetailsState,
        orderDetailsError: orderDetailsError ?? this.orderDetailsError,
      );

  @override
  List<Object?> get props => [
        orderDetails,
        orderDetailsState,
        orderDetailsError,
      ];
}
