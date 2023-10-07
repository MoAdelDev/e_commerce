import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';

class GetAddressesUseCase {
  final BaseAddressRepository baseAddressRepository;

  GetAddressesUseCase(this.baseAddressRepository);

  Future<Either<Failure, List<Address>>> call() async =>
      await baseAddressRepository.getAddresses();
}
