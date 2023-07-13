import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/category.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetCategoriesUseCase{
  final HomeBaseRepository homeBaseRepository;

  GetCategoriesUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Category>>> call() async => await homeBaseRepository.getCategories();
}