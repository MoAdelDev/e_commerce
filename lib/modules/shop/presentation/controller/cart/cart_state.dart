part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Cart> productsCart;
  final RequestState productsCartState;
  final String cartError;

  final String updateCartState;
  final RequestState updateState;
  final String updateError;

  const CartState({
    this.productsCart = const [],
    this.productsCartState = RequestState.loading,
    this.cartError = '',
    this.updateCartState = '',
    this.updateState = RequestState.nothing,
    this.updateError = '',
  });

  CartState copyWith(
          {List<Cart>? productsCart,
          RequestState? productsCartState,
          String? cartError,
          String? updateCartState,
          RequestState? updateState,
          String? updateError}) =>
      CartState(
        productsCart: productsCart ?? this.productsCart,
        productsCartState: productsCartState ?? this.productsCartState,
        cartError: cartError ?? this.cartError,
        updateCartState: updateCartState ?? this.updateCartState,
        updateState: updateState ?? this.updateState,
        updateError: updateError ?? this.updateError,
      );

  @override
  List<Object?> get props => [
        productsCart,
        productsCartState,
        cartError,
        updateCartState,
        updateState,
        updateError,
      ];
}
