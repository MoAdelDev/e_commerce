import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/addresses/data/datasource/addresses_remote_datasource.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

class AddressesRepository extends BaseAddressRepository {
  final BaseAddressesRemoteDataSource baseAddressesRemoteDataSource;

  AddressesRepository(this.baseAddressesRemoteDataSource);

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    try {
      final result = await baseAddressesRemoteDataSource.getAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> addAddress(
      {required AddressModel addressModel}) async {
    try {
      final result = await baseAddressesRemoteDataSource.addAddresses(
          addressModel: addressModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAddress(
      {required int addressId}) async {
    try {
      final result = await baseAddressesRemoteDataSource.deleteAddress(
          addressId: addressId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }
}
