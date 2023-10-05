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

class CatgeoryDetailsChangeFavoritesEvent extends CategoryDetailsBaseEvent {
  final int productId;

  const CatgeoryDetailsChangeFavoritesEvent(this.productId);
}

class CategoryDetailsCahngeCartEvent extends CategoryDetailsBaseEvent {
  final int productId;

  const CategoryDetailsCahngeCartEvent(this.productId);
}
