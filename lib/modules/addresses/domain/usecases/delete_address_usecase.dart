import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';

class DeleteAddressUseCase {
  final BaseAddressRepository baseAddressRepository;

  const DeleteAddressUseCase(this.baseAddressRepository);

  Future<Either<Failure, String>> call(
          {required int addressId}) async =>
      await baseAddressRepository.deleteAddress(addressId: addressId);
}
