import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';

abstract class HomeBaseRepository {
  Future<Either<Failure, List<Product>>> getProducts();

  Future<Either<Failure, User>> getUser();
}
