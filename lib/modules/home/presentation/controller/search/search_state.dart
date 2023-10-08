part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Search> products;
  final RequestState productsState;
  final String productsError;

  const SearchState({
    this.products = const [],
    this.productsState = RequestState.nothing,
    this.productsError = '',
  });

  SearchState copyWith(
          {List<Search>? products,
          RequestState? productsState,
          String? productsError}) =>
      SearchState(
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
      );

  @override
  List<Object> get props => [
        products,
        productsState,
        productsError,
      ];
}
