import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/home/domain/entities/search.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

import '../../../../core/error/failure.dart';

class SearchProductsUseCase {
  final BaseHomeRepository baseHomeRepository;

  const SearchProductsUseCase(this.baseHomeRepository);

  Future<Either<Failure, List<Search>>> call({required String query}) async =>
      await baseHomeRepository.searchProducts(query: query);
}
