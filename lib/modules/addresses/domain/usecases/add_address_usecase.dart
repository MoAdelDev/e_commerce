import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';

class AddAddressUseCase {
  final BaseAddressRepository baseAddressRepository;

  const AddAddressUseCase(this.baseAddressRepository);

  Future<Either<Failure, String>> call(
          {required AddressModel addressModel}) async =>
      await baseAddressRepository.addAddress(addressModel: addressModel);
}
