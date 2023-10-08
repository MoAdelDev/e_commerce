import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/orders/domain/repository/base_orders_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../addresses/domain/entities/address.dart';

class GetAddressesInOrdersUseCase {
  final BaseOrdersRepository baseOrdersRepository;

  const GetAddressesInOrdersUseCase(this.baseOrdersRepository);

  Future<Either<Failure, List<Address>>> call() async => await baseOrdersRepository.getAddresses();
}