import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetCategoryDetailsUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetCategoryDetailsUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Product>>> call({required categoryId}) async =>
      await homeBaseRepository.getCategoryDetails(categoryId: categoryId);
}
