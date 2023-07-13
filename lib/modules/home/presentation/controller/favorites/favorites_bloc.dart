import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/favorite.dart';
import '../../../domain/usecases/get_favorites_usecase.dart';
import '../../../domain/usecases/remove_favorite_usecase.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesBaseEvent, FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  FavoritesBloc(
    this.getFavoritesUseCase,
    this.removeFavoriteUseCase,
  ) : super(const FavoritesState()) {
    on<FavoritesGetEvent>(_getFavorites);
    on<FavoritesRemoveProductEvent>(_removeFavorite);
  }

  FutureOr<void> _getFavorites(
      FavoritesGetEvent event, Emitter<FavoritesState> emit) async {
    final result = await getFavoritesUseCase();

    result.fold(
      (e) => emit(
        state.copyWith(
          favoritesState: RequestState.error,
          favoritesError: e.message,
        ),
      ),
      (favorites) => emit(
        state.copyWith(
            favorites: favorites, favoritesState: RequestState.success),
      ),
    );
  }

  FutureOr<void> _removeFavorite(
      FavoritesRemoveProductEvent event, Emitter<FavoritesState> emit) async {
    final result = await removeFavoriteUseCase(favoriteId: event.favoriteId);
    result.fold((e) {
      showToast(msg: e.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          removeFavoriteError: e.message,
          removeFavoriteState: RequestState.error,
        ),
      );
    }, (message) {
      MyApp.favoriteMap[event.productId] = false;
      add(FavoritesGetEvent());
      showToast(msg: message, requestState: RequestState.success);
      emit(
        state.copyWith(
          removeMessage: message,
          removeFavoriteState: RequestState.success,
        ),
      );
    });
  }
}
