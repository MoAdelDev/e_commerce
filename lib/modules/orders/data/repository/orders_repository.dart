import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/orders/data/datasource/orders_remote_datasource.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

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
  Future<Either<Failure, String>> addOrder({required int addressId}) async {
    try {
      final result =
          await baseOrdersRemoteDataSource.addOrder(addressId: addressId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }
}
