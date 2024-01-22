part of 'favorites_bloc.dart';

abstract class FavoritesBaseEvent extends Equatable {
  const FavoritesBaseEvent();

  @override
  List<Object> get props => [];
}

class FavoritesGetEvent extends FavoritesBaseEvent {}

class FavoritesRemoveProductEvent extends FavoritesBaseEvent {
  final int favoriteId;
  final int productId;

  const FavoritesRemoveProductEvent(this.favoriteId, this.productId);
}
