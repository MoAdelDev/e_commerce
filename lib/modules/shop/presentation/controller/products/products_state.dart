import 'package:e_commerce_app/modules/shop/presentation/screens/carts_screen.dart';
import 'package:e_commerce_app/modules/shop/presentation/screens/products_screen.dart';
import 'package:e_commerce_app/modules/shop/presentation/screens/settings_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../authentication/domain/entities/user.dart';
import '../../../domain/entities/banner.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/favorite.dart';
import '../../../domain/entities/product.dart';
import '../../screens/categories_screen.dart';
import '../../screens/favorites_screen.dart';

class ProductsState extends Equatable {
  /// Bottom Navigation
  final int currentIndex;
  final List<Widget> screens;
  final List<Widget> items;

  /// PRODUCTS
  final List<Product> products;
  final RequestState productsState;
  final String productsError;

  /// Change Favorite
  final Favorite favorite;
  final RequestState favoriteState;
  final String favoriteError;

  /// Banners
  final List<BannerEntity> banners;
  final RequestState bannersState;
  final String bannersError;

  /// Categories
  final List<Category> categories;
  final RequestState categoriesState;
  final String categoriesError;

  /// USER
  final User user;
  final RequestState userState;
  final String userError;

  /// Carts
  final List<ProductCart> carts;
  final RequestState cartsState;
  final String cartsError;

  const ProductsState({
    this.screens = const [
      ProductsScreen(),
      CategoriesScreen(),
      FavoritesScreen(),
      CartsScreen(),
      SettingsScreen(),
    ],
    this.items = const [
      Icon(
        Icons.home,
        color: Colors.white,
      ),
      Icon(Icons.apps, color: Colors.white),
      Icon(Icons.favorite, color: Colors.white),
      Icon(Icons.shopping_cart, color: Colors.white),
      Icon(Icons.settings, color: Colors.white),
    ],
    this.currentIndex = 0,
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsError = '',
    this.favorite = const Favorite(0, 0, 0, 0, 0, '', ''),
    this.favoriteState = RequestState.nothing,
    this.favoriteError = '',
    this.banners = const [],
    this.bannersState = RequestState.loading,
    this.bannersError = '',
    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesError = '',
    this.user = const User(0, '', '', '', '', ''),
    this.userState = RequestState.loading,
    this.userError = '',
    this.carts = const [],
    this.cartsState = RequestState.loading,
    this.cartsError = '',
  });

  ProductsState copyWith({
    int? currentIndex,
    List<Product>? products,
    RequestState? productsState,
    String? productsError,
    List<Favorite>? favorites,
    RequestState? favoritesState,
    String? favoritesError,
    Favorite? favorite,
    RequestState? favoriteState,
    String? favoriteError,
    List<BannerEntity>? banners,
    RequestState? bannersState,
    String? bannersError,
    List<Category>? categories,
    RequestState? categoriesState,
    String? categoriesError,
    User? user,
    RequestState? userState,
    String? userError,
    List<ProductCart>? carts,
    RequestState? cartsState,
    String? cartsError,
  }) =>
      ProductsState(
        currentIndex: currentIndex ?? this.currentIndex,
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
        favorite: favorite ?? this.favorite,
        favoriteState: favoriteState ?? this.favoriteState,
        favoriteError: favoriteError ?? this.favoriteError,
        banners: banners ?? this.banners,
        bannersState: bannersState ?? this.bannersState,
        bannersError: bannersError ?? this.bannersError,
        categories: categories ?? this.categories,
        categoriesState: categoriesState ?? this.categoriesState,
        categoriesError: categoriesError ?? this.categoriesError,
        user: user ?? this.user,
        userState: userState ?? this.userState,
        userError: userError ?? this.userError,
        carts: carts ?? this.carts,
        cartsState: cartsState ?? this.cartsState,
        cartsError: cartsError ?? this.cartsError,
      );

  @override
  List<Object> get props => [
        currentIndex,
        screens,
        items,
        products,
        productsState,
        productsError,
        favorite,
        favoriteState,
        favoriteError,
        banners,
        bannersState,
        bannersError,
        categories,
        categoriesState,
        categoriesError,
        user,
        userState,
        userError,
        carts,
        cartsState,
        cartsError,
      ];
}
