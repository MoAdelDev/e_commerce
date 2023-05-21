import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/favorite.dart';

class FavoritesState extends Equatable {
  /// Favorites
  final List<Favorite> favorites;
  final RequestState favoritesState;
  final String favoritesError;

  const FavoritesState({
    this.favorites = const [],
    this.favoritesState = RequestState.loading,
    this.favoritesError = '',
  });

  FavoritesState copyWith({
    List<Favorite>? favorites,
    RequestState? favoritesState,
    String? favoritesError,
  }) =>
      FavoritesState(
        favorites: favorites ?? this.favorites,
        favoritesState: favoritesState ?? this.favoritesState,
        favoritesError: favoritesError ?? this.favoritesError,
      );

  @override
  List<Object> get props => [favorites, favoritesState, favoritesError];
}
