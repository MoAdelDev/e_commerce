import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class HomeGetCategoriesUseCase{
  final HomeBaseRepository homeBaseRepository;

  HomeGetCategoriesUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Category>>> call() async => await homeBaseRepository.getCategories();
}