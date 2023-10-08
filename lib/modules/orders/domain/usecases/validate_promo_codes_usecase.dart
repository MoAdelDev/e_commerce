import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';

class ValidatePromoCodesUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const ValidatePromoCodesUseCase(this.baseOrdersRepository);

  Future<Either<Failure, String>> call({required String code}) async =>
      await baseOrdersRepository.validatePromoCode(code: code);
}
