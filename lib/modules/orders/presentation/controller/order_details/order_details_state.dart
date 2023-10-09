part of 'order_details_bloc.dart';

class OrderDetailsState extends Equatable {
  final OrderDetails? orderDetails;
  final RequestState orderDetailsState;
  final String orderDetailsError;

  final String cancelOrderMsg;
  final RequestState cancelOrderState;
  final String cancelOrderError;

  const OrderDetailsState({
    this.orderDetails,
    this.orderDetailsState = RequestState.nothing,
    this.orderDetailsError = '',
    this.cancelOrderMsg = '',
    this.cancelOrderState = RequestState.nothing,
    this.cancelOrderError = '',
  });

  OrderDetailsState copyWith({
    OrderDetails? orderDetails,
    RequestState? orderDetailsState,
    String? orderDetailsError,
    String? cancelOrderMsg,
    RequestState? cancelOrderState,
    String? cancelOrderError,
  }) =>
      OrderDetailsState(
        orderDetails: orderDetails ?? this.orderDetails,
        orderDetailsState: orderDetailsState ?? this.orderDetailsState,
        orderDetailsError: orderDetailsError ?? this.orderDetailsError,
        cancelOrderMsg: cancelOrderMsg ?? this.cancelOrderMsg,
        cancelOrderState: cancelOrderState ?? this.cancelOrderState,
        cancelOrderError: cancelOrderError ?? this.cancelOrderError,
      );

  @override
  List<Object?> get props => [
        orderDetails,
        orderDetailsState,
        orderDetailsError,
        cancelOrderMsg,
        cancelOrderState,
        cancelOrderError,
      ];
}
