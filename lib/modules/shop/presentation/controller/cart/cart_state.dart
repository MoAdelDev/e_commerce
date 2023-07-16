part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;
  final RequestState productsCartState;
  final String cartError;

  final String updateCartState;
  final RequestState updateState;
  final String updateError;

  final String deleteCartState;
  final RequestState deleteState;
  final String deleteError;

  const CartState({
    this.cart = const Cart([], 0.0),
    this.productsCartState = RequestState.loading,
    this.cartError = '',
    this.updateCartState = '',
    this.updateState = RequestState.nothing,
    this.updateError = '',
    this.deleteCartState = '',
    this.deleteState = RequestState.nothing,
    this.deleteError = '',
  });

  CartState copyWith(
          {Cart? cart,
          RequestState? productsCartState,
          String? cartError,
          String? updateCartState,
          RequestState? updateState,
          String? updateError,
          String? deleteCartState,
          RequestState? deleteState,
          String? deleteError}) =>
      CartState(
        cart: cart ?? this.cart,
        productsCartState: productsCartState ?? this.productsCartState,
        cartError: cartError ?? this.cartError,
        updateCartState: updateCartState ?? this.updateCartState,
        updateState: updateState ?? this.updateState,
        updateError: updateError ?? this.updateError,
        deleteCartState: deleteCartState ?? this.deleteCartState,
        deleteState: deleteState ?? this.deleteState,
        deleteError: deleteError ?? this.deleteError,
      );

  @override
  List<Object?> get props => [
        cart,
        productsCartState,
        cartError,
        updateCartState,
        updateState,
        updateError,
        deleteCartState,
        deleteError,
        deleteState
      ];
}
