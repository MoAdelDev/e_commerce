part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  /// Get Favorites
  final List<Favorite> favorites;
  final RequestState favoritesState;
  final String favoritesError;

  /// Remove favorite
  final RequestState removeFavoriteState;
  final String removeFavoriteError;
  final String removeMessage;

  const FavoritesState({
    this.favorites = const [],
    this.favoritesState = RequestState.loading,
    this.favoritesError = '',
    this.removeMessage = '',
    this.removeFavoriteState = RequestState.nothing,
    this.removeFavoriteError = '',
  });

  FavoritesState copyWith({
    List<Favorite>? favorites,
    RequestState? favoritesState,
    String? favoritesError,
    String? removeMessage,
    RequestState? removeFavoriteState,
    String? removeFavoriteError,
  }) =>
      FavoritesState(
        favorites: favorites ?? this.favorites,
        favoritesState: favoritesState ?? this.favoritesState,
        favoritesError: favoritesError ?? this.favoritesError,
        removeMessage: removeMessage ?? this.removeMessage,
        removeFavoriteState: removeFavoriteState ?? this.removeFavoriteState,
        removeFavoriteError: removeFavoriteError ?? this.removeFavoriteError,
      );

  @override
  List<Object> get props => [
        favorites,
        favoritesState,
        favoritesError,
        removeFavoriteState,
        removeFavoriteError,
        removeMessage,
      ];
}
