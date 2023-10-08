import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

abstract class BaseOrdersRepository {
  Future<Either<Failure, String>> validatePromoCode({required String code});

  Future<Either<Failure, List<Address>>> getAddresses();


  Future<Either<Failure, String>> addOrder({required int addressId});

}