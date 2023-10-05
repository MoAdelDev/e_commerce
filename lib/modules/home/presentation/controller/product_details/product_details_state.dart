part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final Product? product;
  final RequestState productState;
  final String productMessage;
  final String cartMessage;
  final RequestState addProductToCartState;
  final String addProductToCartError;

  final double top;

  const ProductDetailsState({
    this.product,
    this.productState = RequestState.loading,
    this.productMessage = '',
    this.top = 0.0,
    this.cartMessage = '',
    this.addProductToCartState = RequestState.nothing,
    this.addProductToCartError = '',
  });

  ProductDetailsState copyWith({
    Product? product,
    RequestState? productState,
    String? productMessage,
    double? top,
    String? cartMessage,
    RequestState? addProductToCartState,
    String? addProductToCartError,
  }) =>
      ProductDetailsState(
        product: product ?? this.product,
        productState: productState ?? this.productState,
        productMessage: productMessage ?? this.productMessage,
        top: top ?? this.top,
        cartMessage: cartMessage ?? this.cartMessage,
        addProductToCartState:
            addProductToCartState ?? this.addProductToCartState,
        addProductToCartError:
            addProductToCartError ?? this.addProductToCartError,
      );

  @override
  List<Object?> get props => [
        product,
        productState,
        productMessage,
        top,
        cartMessage,
        addProductToCartState,
        addProductToCartError,
      ];
}
