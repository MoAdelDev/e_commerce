part of 'product_details_bloc.dart';

abstract class ProductDetailsBaseEvent extends Equatable {
  const ProductDetailsBaseEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailsGetEvent extends ProductDetailsBaseEvent {
  final int productId;

  const ProductDetailsGetEvent(this.productId);
}

class ProductDetailsChangeTopConstraintEvent extends ProductDetailsBaseEvent {
  final BoxConstraints constraints;

  const ProductDetailsChangeTopConstraintEvent(this.constraints);
}

class ProductDetailsAddOrRemoveProductToCartEvent
    extends ProductDetailsBaseEvent {
  final int productId;

  const ProductDetailsAddOrRemoveProductToCartEvent(this.productId);
}
