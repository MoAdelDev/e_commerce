import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

abstract class BaseAddressRepository {

  Future<Either<Failure, List<Address>>> getAddresses();

  Future<Either<Failure, String>> addAddress({required AddressModel addressModel});

}