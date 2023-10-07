import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

abstract class BaseAddressRepository {

  Future<Either<Failure, List<Address>>> getAddress();
}