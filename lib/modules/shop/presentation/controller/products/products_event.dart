import 'package:equatable/equatable.dart';

abstract class ProductsBaseEvent extends Equatable {
  const ProductsBaseEvent();

  @override
  List<Object> get props => [];
}

class HomeChangeBottomNavIndexEvent extends ProductsBaseEvent {
  final int index;

  const HomeChangeBottomNavIndexEvent(this.index);

}

class HomeGetProductsEvent extends ProductsBaseEvent {}

class HomeGetBannersEvent extends ProductsBaseEvent {}

class HomeGetCategoriesEvent extends ProductsBaseEvent {}

class HomeGetUserEvent extends ProductsBaseEvent {}

class HomeChangeFavoriteEvent extends ProductsBaseEvent {
  final int productId;

  const HomeChangeFavoriteEvent(this.productId);
}

class HomeGetCartsEvent extends ProductsBaseEvent {}

