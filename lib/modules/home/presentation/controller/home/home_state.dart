import 'package:e_commerce_app/modules/home/presentation/screens/home/carts_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/products_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/settings/settings_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../authentication/domain/entities/user.dart';
import '../../../domain/entities/banner.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/favorite.dart';
import '../../../domain/entities/product.dart';
import '../../screens/home/categories_screen.dart';
import '../../screens/home/favorites_screen.dart';

class HomeState extends Equatable {
  /// Bottom Navigation
  final int currentIndex;
  final List<Widget> screens;
  final List<Widget> items;
  final List<String> arabicTitles;
  final List<String> englishTitles;

  /// PRODUCTS
  final List<Product> products;
  final RequestState productsState;
  final String productsError;

  /// Change Favorite
  final String favoriteMessage;
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
  final List<CartProduct> carts;
  final RequestState cartsState;
  final String cartsError;

  /// Language
  final String language;

  /// Night mode
  final bool isDark;

  /// sign out
  final String signOutError;
  final RequestState signOutState;

  /// Update profile
  final String updateProfileMsg;
  final String updateProfileError;
  final RequestState updateProfileState;

  const HomeState({
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
    this.arabicTitles = const [
      'الصفحة الرئيسية',
      'التصنيفات',
      'المفضلات',
      'السلة',
      'الإعدادات'
    ],
    this.englishTitles = const [
      'Home',
      'Categories',
      'Favorites',
      'Cart',
      'Settings'
    ],
    this.currentIndex = 0,
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsError = '',
    this.favoriteMessage = '',
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
    this.language = 'english',
    this.isDark = false,
    this.signOutError = '',
    this.signOutState = RequestState.nothing,
    this.updateProfileMsg = '',
    this.updateProfileError = '',
    this.updateProfileState = RequestState.nothing,
  });

  HomeState copyWith({
    int? currentIndex,
    List<Product>? products,
    RequestState? productsState,
    String? productsError,
    List<Favorite>? favorites,
    RequestState? favoritesState,
    String? favoritesError,
    String? favoriteMessage,
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
    List<CartProduct>? carts,
    RequestState? cartsState,
    String? cartsError,
    String? language,
    bool? isDark,
    String? signOutError,
    RequestState? signOutState,
    String? updateProfileMsg,
    String? updateProfileError,
    RequestState? updateProfileState,
  }) =>
      HomeState(
        currentIndex: currentIndex ?? this.currentIndex,
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsError: productsError ?? this.productsError,
        favoriteMessage: favoriteMessage ?? this.favoriteMessage,
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
        language: language ?? this.language,
        isDark: isDark ?? this.isDark,
        signOutError: signOutError ?? this.signOutError,
        signOutState: signOutState ?? this.signOutState,
        updateProfileMsg: updateProfileMsg ?? this.updateProfileMsg,
        updateProfileError: updateProfileError ?? this.updateProfileError,
        updateProfileState: updateProfileState ?? this.updateProfileState,
      );

  @override
  List<Object> get props => [
        currentIndex,
        screens,
        items,
        arabicTitles,
        englishTitles,
        products,
        productsState,
        productsError,
        favoriteMessage,
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
        language,
        isDark,
        signOutError,
        signOutState,
        updateProfileMsg,
        updateProfileError,
        updateProfileState,
      ];
}
