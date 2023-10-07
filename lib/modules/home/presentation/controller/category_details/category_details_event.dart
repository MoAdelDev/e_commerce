part of 'category_details_bloc.dart';

abstract class CategoryDetailsBaseEvent extends Equatable {
  const CategoryDetailsBaseEvent();

  @override
  List<Object> get props => [];
}

class CategoryDetailsGetEvent extends CategoryDetailsBaseEvent {
  final int categoryId;

  const CategoryDetailsGetEvent(this.categoryId);
}

class CategoryDetailsChangeFavoritesEvent extends CategoryDetailsBaseEvent {
  final int productId;

  const CategoryDetailsChangeFavoritesEvent(this.productId);
}

class CategoryDetailsChangeCartEvent extends CategoryDetailsBaseEvent {
  final int productId;

  const CategoryDetailsChangeCartEvent(this.productId);
}
