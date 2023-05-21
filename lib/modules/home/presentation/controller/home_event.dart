part of 'home_bloc.dart';

abstract class HomeBaseEvent extends Equatable {
  const HomeBaseEvent();

  @override
  List<Object> get props => [];
}

class HomeGetProductsEvent extends HomeBaseEvent {}

class HomeGetBannersEvent extends HomeBaseEvent {}

class HomeGetCategoriesEvent extends HomeBaseEvent {}

class HomeGetUserEvent extends HomeBaseEvent {}
