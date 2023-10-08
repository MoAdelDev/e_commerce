import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order.dart'
    as order;
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';

class GetOrdersUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const GetOrdersUseCase(this.baseOrdersRepository);

  Future<Either<Failure, List<order.Order>>> call() async =>
      await baseOrdersRepository.getOrders();
}
