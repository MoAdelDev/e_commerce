part of 'home_bloc.dart';

class HomeState extends Equatable {
  /// PRODUCTS
  final List<Product> products;
  final RequestState productsState;
  final String productsError;

  /// Banners
  final List<Banner> banners;
  final RequestState bannersState;
  final String bannersError;

  /// Categories
  final List<Category> categories;
  final RequestState categoriesState;
  final String categoriesError;

  /// USER
  final User user;
  final RequestState userState;
  final String userError;

  const HomeState({
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsError = '',
    this.banners = const [],
    this.bannersState = RequestState.loading,
    this.bannersError = '',
    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesError = '',
    this.user = const User(0, '', '', '', '', ''),
    this.userState = RequestState.loading,
    this.userError = '',
  });

  HomeState copyWith({
    List<Product>? products,
    RequestState? productsState,
    String? productsError,
    List<Banner>? banners,
    RequestState? bannersState,
    String? bannersError,
    List<Category>? categories,
    RequestState? categoriesState,
    String? categoriesError,
    User? user,
    RequestState? userState,
    String? userError,
  }) =>
      HomeState(
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
        banners: banners ?? this.banners,
        bannersState: bannersState ?? this.bannersState,
        bannersError: bannersError ?? this.bannersError,
        categories: categories ?? this.categories,
        categoriesState: categoriesState ?? this.categoriesState,
        categoriesError: categoriesError ?? this.categoriesError,
        user: user ?? this.user,
        userState: userState ?? this.userState,
        userError: userError ?? this.userError,
      );

  @override
  List<Object> get props => [
        products,
        productsState,
        productsError,
        user,
        userState,
        userError,
        banners,
        bannersState,
        bannersError,
        categories,
        categoriesState,
        categoriesError,
      ];
}
