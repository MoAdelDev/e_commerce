import 'dart:async';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_favorites_usecase.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesBaseEvent, FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesBloc(this.getFavoritesUseCase) : super(const FavoritesState()) {
    on<FavoritesGetEvent>(_getFavorites);
  }

  FutureOr<void> _getFavorites(
      FavoritesGetEvent event, Emitter<FavoritesState> emit) async {
    final result = await getFavoritesUseCase();
    result.fold(
      (error) => emit(
        state.copyWith(
          favoritesState: RequestState.error,
          favoritesError: error.message,
        ),
      ),
      (favorites) => emit(
        state.copyWith(
          favorites: favorites,
          favoritesState: RequestState.success,
        ),
      ),
    );
  }
}
