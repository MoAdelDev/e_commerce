part of 'order_confirmation_bloc.dart';

abstract class BaseOrderConfirmationEvent extends Equatable {
  const BaseOrderConfirmationEvent();
}

class OrderConfirmationStateGetAddressesEvent extends BaseOrderConfirmationEvent {
  const OrderConfirmationStateGetAddressesEvent();

  @override
  List<Object> get props => [];
}

class OrderConfirmationValidatePromoCodesEvent extends BaseOrderConfirmationEvent {
  final String code;

  const OrderConfirmationValidatePromoCodesEvent(this.code);

  @override
  List<Object> get props => [code];
}

class OrderConfirmationChangeAddressEvent extends BaseOrderConfirmationEvent {
  final int addressId;
  final int addressSelected;

  const OrderConfirmationChangeAddressEvent(
      {required this.addressId, required this.addressSelected});

  @override
  List<Object> get props => [addressId, addressSelected];
}

class OrderConfirmationAddOrderEvent extends BaseOrderConfirmationEvent {
  final int addressId;
  final BuildContext context;

  const OrderConfirmationAddOrderEvent({
    required this.addressId,
    required this.context,
  });

  @override
  List<Object> get props => [
        addressId,
        context,
      ];
}
