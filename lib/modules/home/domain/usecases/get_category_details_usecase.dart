import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetCategoryDetailsUseCase {
  final BaseHomeRepository homeBaseRepository;

  GetCategoryDetailsUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Product>>> call({required categoryId}) async =>
      await homeBaseRepository.getCategoryDetails(categoryId: categoryId);
}
