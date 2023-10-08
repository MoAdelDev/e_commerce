part of 'search_bloc.dart';

abstract class BaseSearchEvent extends Equatable {
  const BaseSearchEvent();
}

class SearchProductsEvent extends BaseSearchEvent {
  final String query;

  const SearchProductsEvent(this.query);

  @override
  List<Object> get props => [query];

}
