part of 'home_bloc.dart';

class HomeState extends Equatable {
  /// PRODUCTS
  final List<Product> products;
  final RequestState productsState;
  final String productsError;

  /// USER
  final User user;
  final RequestState userState;
  final String userError;

  const HomeState({
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsError = '',
    this.user = const User(0, '', '', '', '', ''),
    this.userState = RequestState.loading,
    this.userError = '',
  });

  HomeState copyWith({
    List<Product>? products,
    RequestState? productsState,
    String? productsError,
    User? user,
    RequestState? userState,
    String? userError,
  }) =>
      HomeState(
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
        user: user ?? this.user,
        userState: userState ?? this.userState,
        userError: userError ?? this.userError,
      );

  @override
  List<Object> get props =>
      [products, productsState, productsError, user, userState, userError];
}
