import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetCategoriesUseCase{
  final BaseHomeRepository homeBaseRepository;

  GetCategoriesUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Category>>> call() async => await homeBaseRepository.getCategories();
}