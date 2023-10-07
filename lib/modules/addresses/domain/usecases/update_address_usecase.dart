import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/repository/base_addresses_repository.dart';

import '../../../../core/error/failure.dart';

class UpdateAddressUseCase {
  final BaseAddressRepository baseAddressRepository;

  const UpdateAddressUseCase(this.baseAddressRepository);

  Future<Either<Failure, String>> call(
          {required AddressModel addressModel}) async =>
      await baseAddressRepository.updateAddress(addressModel: addressModel);
}
