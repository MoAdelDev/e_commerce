part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final Product? product;
  final RequestState productState;
  final String productMessage;

  const ProductDetailsState({
    this.product,
    this.productState = RequestState.loading,
    this.productMessage = '',
  });

  ProductDetailsState copyWith({
    Product? product,
    RequestState? productState,
    String? productMessage,
  }) =>
      ProductDetailsState(
        product: product ?? this.product,
        productState: productState ?? this.productState,
        productMessage: productMessage ?? this.productMessage,
      );

  @override
  List<Object?> get props => [
        product,
        productState,
        productMessage,
      ];
}
