part of 'category_details_bloc.dart';

class CategoryDetailsState extends Equatable {
  final List<Product> products;
  final RequestState productsState;
  final String productsError;

  final String favoriteMessage;
  final RequestState favoriteState;
  final String favoriteError;

  final String cartMessage;
  final RequestState cartState;
  final String cartError;

  const CategoryDetailsState({
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsError = '',
    this.favoriteMessage = '',
    this.favoriteState = RequestState.nothing,
    this.favoriteError = '',
    this.cartMessage = '',
    this.cartState = RequestState.nothing,
    this.cartError = '',
  });

  CategoryDetailsState copyWith({
    List<Product>? products,
    RequestState? productsState,
    String? productsError,
    String? favoriteMessage,
    RequestState? favoriteState,
    String? favoriteError,
    String? cartMessage,
    RequestState? cartState,
    String? cartError,
  }) =>
      CategoryDetailsState(
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
        favoriteMessage: favoriteMessage ?? this.favoriteMessage,
        favoriteState: favoriteState ?? this.favoriteState,
        favoriteError: favoriteError ?? this.favoriteError,
        cartMessage: cartMessage ?? this.cartMessage,
        cartState: cartState ?? this.cartState,
        cartError: cartError ?? this.cartError,
      );
  @override
  List<Object> get props => [
        products,
        productsState,
        productsError,
        favoriteMessage,
        favoriteState,
        favoriteError,
        cartMessage,
        cartState,
        cartError,
      ];
}
