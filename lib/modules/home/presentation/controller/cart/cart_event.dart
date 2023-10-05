part of 'cart_bloc.dart';

abstract class CartBaseEvent extends Equatable {
  const CartBaseEvent();

  @override
  List<Object> get props => [];
}

class CartGetProductsCartEvent extends CartBaseEvent {}

class CartUpdateProductsCartEvent extends CartBaseEvent {
  final int cartId;
  final int quantity;
  final int productId;

  const CartUpdateProductsCartEvent(this.cartId, this.quantity, this.productId);
}

class CartDeleteProductFromCartEvent extends CartBaseEvent {
  final int cartId;
  final int productId;

  const CartDeleteProductFromCartEvent(this.cartId, this.productId);
}
