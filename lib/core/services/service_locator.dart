import 'package:e_commerce_app/modules/addresses/data/datasource/addresses_remote_datasource.dart';
import 'package:e_commerce_app/modules/addresses/data/repository/addresses_repository.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/add_address_usecase.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/delete_address_usecase.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/get_addresses_usecase.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/update_address_usecase.dart';
import 'package:e_commerce_app/modules/home/data/datasource/home_local_datasource.dart';
import 'package:e_commerce_app/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:e_commerce_app/modules/home/data/repository/home_repository.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/change_favorite_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/change_language_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/change_night_mode_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/delete_product_from_carts_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_banners_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_categories_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_category_details_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_favorites_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_product_details_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/remove_favorite_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/search_products_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/signout_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/update_cart_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/update_profile_usecase.dart';
import 'package:e_commerce_app/modules/orders/data/datasource/orders_remote_datasource.dart';
import 'package:e_commerce_app/modules/orders/data/repository/orders_repository.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/add_order_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/cancel_order_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_addresses_in_orders_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/get_orders_usecase.dart';
import 'package:e_commerce_app/modules/orders/domain/usecases/validate_promo_codes_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../modules/authentication/data/datasource/auth_remote_datasource.dart';
import '../../modules/authentication/data/repository/auth_repository.dart';
import '../../modules/authentication/domain/repository/base_authentication_repository.dart';
import '../../modules/authentication/domain/usecases/login_usecase.dart';
import '../../modules/authentication/domain/usecases/register_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// DATA SOURCE
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());

    sl.registerLazySingleton<BaseAddressesRemoteDataSource>(
        () => AddressesRemoteDataSource());

    sl.registerLazySingleton<BaseOrdersRemoteDataSource>(
        () => OrdersRemoteDataSource());

    sl.registerLazySingleton<BaseHomeLocalDataSource>(
        () => HomeLocalDataSource());

    /// REPOSITORY
    sl.registerLazySingleton<BaseAuthenticationRepository>(
        () => AuthRepository(sl()));

    sl.registerLazySingleton<BaseAddressRepository>(
        () => AddressesRepository(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(sl(), sl()));

    sl.registerLazySingleton<BaseOrdersRepository>(
        () => OrdersRepository(sl()));

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

    sl.registerLazySingleton<GetCategoryDetailsUseCase>(
        () => GetCategoryDetailsUseCase(sl()));

    sl.registerLazySingleton<ChangeLanguageUseCase>(
        () => ChangeLanguageUseCase(sl()));

    sl.registerLazySingleton<ChangeNightModeUseCase>(
        () => ChangeNightModeUseCase(sl()));

    sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(sl()));

    sl.registerLazySingleton<GetAddressesUseCase>(
        () => GetAddressesUseCase(sl()));

    sl.registerLazySingleton<AddAddressUseCase>(() => AddAddressUseCase(sl()));

    sl.registerLazySingleton<DeleteAddressUseCase>(
        () => DeleteAddressUseCase(sl()));

    sl.registerLazySingleton<UpdateAddressUseCase>(
        () => UpdateAddressUseCase(sl()));

    sl.registerLazySingleton<UpdateProfileUseCase>(
        () => UpdateProfileUseCase(sl()));

    sl.registerLazySingleton<SearchProductsUseCase>(
        () => SearchProductsUseCase(sl()));

    sl.registerLazySingleton<ValidatePromoCodesUseCase>(
        () => ValidatePromoCodesUseCase(sl()));

    sl.registerLazySingleton<GetAddressesInOrdersUseCase>(
        () => GetAddressesInOrdersUseCase(sl()));

    sl.registerLazySingleton<AddOrderUseCase>(() => AddOrderUseCase(sl()));

    sl.registerLazySingleton<GetOrdersUseCase>(() => GetOrdersUseCase(sl()));

    sl.registerLazySingleton<GetOrderDetailsUseCase>(
        () => GetOrderDetailsUseCase(sl()));

    sl.registerLazySingleton<CancelOrderUseCase>(
        () => CancelOrderUseCase(sl()));
  }
}
