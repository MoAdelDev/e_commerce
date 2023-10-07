import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/addresses/data/datasource/addresses_remote_datasource.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

class AddressesRepository extends BaseAddressRepository {
  final BaseAddressesRemoteDataSource baseAddressesRemoteDataSource;

  AddressesRepository(this.baseAddressesRemoteDataSource);

  @override
  Future<Either<Failure, List<Address>>> getAddress() async {
    try {
      final result = await baseAddressesRemoteDataSource.getAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }
}
