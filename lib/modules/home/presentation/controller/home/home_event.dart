import 'package:equatable/equatable.dart';

abstract class BaseHomeEvent extends Equatable {
  const BaseHomeEvent();

  @override
  List<Object> get props => [];
}

class HomeChangeBottomNavIndexEvent extends BaseHomeEvent {
  final int index;

  const HomeChangeBottomNavIndexEvent(this.index);

}

class HomeGetProductsEvent extends BaseHomeEvent {}

class HomeGetBannersEvent extends BaseHomeEvent {}

class HomeGetCategoriesEvent extends BaseHomeEvent {}

class HomeGetUserEvent extends BaseHomeEvent {}

class HomeChangeFavoriteEvent extends BaseHomeEvent {
  final int productId;

  const HomeChangeFavoriteEvent(this.productId);
}

class HomeGetCartsEvent extends BaseHomeEvent {
  const HomeGetCartsEvent();
}

class HomeChangeLanguageEvent extends BaseHomeEvent {
  final String language;

  const HomeChangeLanguageEvent(this.language);

  @override
  List<Object> get props => [language];

}

class HomeChangeNightModeEvent extends BaseHomeEvent {
  final bool isDark;

  const HomeChangeNightModeEvent(this.isDark);

  @override
  List<Object> get props => [isDark];

}


