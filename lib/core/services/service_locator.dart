import 'package:e_commerce_app/modules/shop/data/datasource/home_datasource.dart';
import 'package:e_commerce_app/modules/shop/data/repository/home_repository.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/change_favorite_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/delete_product_from_carts_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_banners_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_categories_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_favorites_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_product_details_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/get_user_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/remove_favorite_usecase.dart';
import 'package:e_commerce_app/modules/shop/domain/usecases/update_cart_usecase.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/cart/cart_bloc.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/favorites/favorites_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../modules/authentication/data/datasource/auth_datasource.dart';
import '../../modules/authentication/data/repository/auth_repository.dart';
import '../../modules/authentication/domain/repository/authentication_base_repository.dart';
import '../../modules/authentication/domain/usecases/login_usecase.dart';
import '../../modules/authentication/domain/usecases/register_usecase.dart';
import '../../modules/authentication/presentation/controller/login/login_bloc.dart';
import '../../modules/authentication/presentation/controller/register/register_bloc.dart';
import '../../modules/shop/presentation/controller/product_details/product_details_bloc.dart';
import '../../modules/shop/presentation/controller/products/products_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
    sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
    sl.registerFactory<ProductsBloc>(
      () => ProductsBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerFactory<FavoritesBloc>(
      () => FavoritesBloc(
        sl(),
        sl(),
      ),
    );

    sl.registerFactory<ProductDetailsBloc>(
      () => ProductDetailsBloc(
        sl(),
        sl(),
      ),
    );

    sl.registerFactory<CartBloc>(
      () => CartBloc(
        sl(),
        sl(),
        sl(),
      ),
    );

    /// DATA SOURCE
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource());

    sl.registerLazySingleton<HomeBaseDataSource>(() => HomeDataSource());

    /// REPOSITORY
    sl.registerLazySingleton<AuthenticationBaseRepository>(
        () => AuthRepository(sl()));

    sl.registerLazySingleton<HomeBaseRepository>(() => HomeRepository(sl()));

    ///  USE CASES
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(sl()));
    sl.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(sl()));
    sl.registerLazySingleton<GetBannersUseCase>(() => GetBannersUseCase(sl()));
    sl.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton<ChangeFavoriteUseCase>(
        () => ChangeFavoriteUseCase(sl()));
    sl.registerLazySingleton<GetFavoritesUseCase>(
        () => GetFavoritesUseCase(sl()));
    sl.registerLazySingleton<RemoveFavoriteUseCase>(
        () => RemoveFavoriteUseCase(sl()));
    sl.registerLazySingleton<GetProductDetailsUseCase>(
        () => GetProductDetailsUseCase(sl()));
    sl.registerLazySingleton<AddProductToCartUseCase>(
        () => AddProductToCartUseCase(sl()));
    sl.registerLazySingleton<GetProductsCartUseCase>(
        () => GetProductsCartUseCase(sl()));
    sl.registerLazySingleton<UpdateCartUseCase>(() => UpdateCartUseCase(sl()));
    sl.registerLazySingleton<DeleteProductFromCartUseCase>(
        () => DeleteProductFromCartUseCase(sl()));
  }
}
