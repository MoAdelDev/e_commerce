part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final Product? product;
  final RequestState productState;
  final String productMessage;

  final double top;

  const ProductDetailsState({
    this.product,
    this.productState = RequestState.loading,
    this.productMessage = '',
    this.top = 0.0,
  });

  ProductDetailsState copyWith({
    Product? product,
    RequestState? productState,
    String? productMessage,
    double? top,
  }) =>
      ProductDetailsState(
        product: product ?? this.product,
        productState: productState ?? this.productState,
        productMessage: productMessage ?? this.productMessage,
        top: top ?? this.top,
      );

  @override
  List<Object?> get props =>
      [
        product,
        productState,
        productMessage,
        top,
      ];
}
