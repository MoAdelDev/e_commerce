import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/orders/data/datasource/orders_remote_datasource.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../domain/entities/order.dart' as order;

class OrdersRepository extends BaseOrdersRepository {
  final BaseOrdersRemoteDataSource baseOrdersRemoteDataSource;

  OrdersRepository(this.baseOrdersRemoteDataSource);

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    try {
      final result = await baseOrdersRemoteDataSource.getAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> validatePromoCode(
      {required String code}) async {
    try {
      final result =
          await baseOrdersRemoteDataSource.validatePromoCode(code: code);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> addOrder(
      {required int addressId, required bool isPaymentMethod}) async {
    try {
      final result = await baseOrdersRemoteDataSource.addOrder(
          addressId: addressId, isPaymentMethod: isPaymentMethod);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<order.Order>>> getOrders() async {
    try {
      final result = await baseOrdersRemoteDataSource.getOrders();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrderDetails(
      {required int orderId}) async {
    try {
      final result =
          await baseOrdersRemoteDataSource.getOrderDetails(orderId: orderId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> cancelOrder({required int orderId}) async {
    try {
      final result =
          await baseOrdersRemoteDataSource.cancelOrder(orderId: orderId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }
}
