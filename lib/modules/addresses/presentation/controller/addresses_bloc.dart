import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_addresses_usecase.dart';

part 'addresses_event.dart';

part 'addresses_state.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  final GetAddressesUseCase getAddressesUseCase;

  AddressesBloc(this.getAddressesUseCase) : super(const AddressesState()) {
    on<AddressesGetEvent>(_getAddress);
  }

  FutureOr<void> _getAddress(
      AddressesGetEvent event, Emitter<AddressesState> emit) async {
    final result = await getAddressesUseCase();
    result.fold(
        (error) => emit(state.copyWith(
            addressesState: RequestState.error,
            addressesError: error.message)), (addresses) {
      emit(state.copyWith(
          addresses: addresses, addressesState: RequestState.success));
    });
  }
}
