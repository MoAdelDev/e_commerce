import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';

class CancelOrderUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const CancelOrderUseCase(this.baseOrdersRepository);

  Future<Either<Failure, String>> call({required int orderId}) async =>
      await baseOrdersRepository.cancelOrder(orderId: orderId);
}
