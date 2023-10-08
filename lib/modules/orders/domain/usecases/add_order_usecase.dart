import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';

class AddOrderUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const AddOrderUseCase(this.baseOrdersRepository);

  Future<Either<Failure, String>> call({required int addressId}) async =>
      await baseOrdersRepository.addOrder(addressId: addressId);
}
