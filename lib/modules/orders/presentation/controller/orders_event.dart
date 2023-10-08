part of 'orders_bloc.dart';

abstract class BaseOrdersEvent extends Equatable {
  const BaseOrdersEvent();
}

class OrdersGetAddressesEvent extends BaseOrdersEvent {
  const OrdersGetAddressesEvent();

  @override
  List<Object> get props => [];
}

class OrdersValidatePromoCodesEvent extends BaseOrdersEvent {
  final String code;

  const OrdersValidatePromoCodesEvent(this.code);

  @override
  List<Object> get props => [code];
}

class OrdersChangeAddressEvent extends BaseOrdersEvent {
  final int addressId;
  final int addressSelected;

  const OrdersChangeAddressEvent(
      {required this.addressId, required this.addressSelected});

  @override
  List<Object> get props => [addressId, addressSelected];
}

class OrdersAddOrderEvent extends BaseOrdersEvent {
  final int addressId;
  final BuildContext context;

  const OrdersAddOrderEvent({
    required this.addressId,
    required this.context,
  });

  @override
  List<Object> get props => [
        addressId,
        context,
      ];
}
