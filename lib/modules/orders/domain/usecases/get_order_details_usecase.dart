import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';

class GetOrderDetailsUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const GetOrderDetailsUseCase(this.baseOrdersRepository);

  Future<Either<Failure, OrderDetails>> call({required int orderId}) async =>
      await baseOrdersRepository.getOrderDetails(orderId: orderId);
}
