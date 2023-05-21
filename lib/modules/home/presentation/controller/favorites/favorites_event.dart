import 'package:equatable/equatable.dart';

abstract class FavoritesBaseEvent extends Equatable {
  const FavoritesBaseEvent();

  @override
  List<Object> get props => [];
}

class FavoritesGetEvent extends FavoritesBaseEvent{}
