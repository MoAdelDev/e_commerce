import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/add_address_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/usecases/get_addresses_usecase.dart';
import 'package:geolocator/geolocator.dart';

part 'addresses_event.dart';

part 'addresses_state.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  final GetAddressesUseCase getAddressesUseCase;
  final AddAddressUseCase addAddressUseCase;

  AddressesBloc(
    this.getAddressesUseCase,
    this.addAddressUseCase,
  ) : super(const AddressesState()) {
    on<AddressesGetEvent>(_getAddresses);
    on<AddressesAddEvent>(_addAddress);
  }

  FutureOr<void> _getAddresses(
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

  FutureOr<void> _addAddress(
      AddressesAddEvent event, Emitter<AddressesState> emit) async {
    emit(state.copyWith(addAddressState: RequestState.loading));
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    AddressModel addressModel = AddressModel(
      0,
      event.name,
      event.notes,
      event.city,
      event.region,
      event.address,
      position.latitude,
      position.longitude,
    );
    final result = await addAddressUseCase(addressModel: addressModel);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          addAddressState: RequestState.error, addAddressError: error.message));
    }, (message) {
      showToast(msg: message, requestState: RequestState.success);
      emit(state.copyWith(
          addAddressState: RequestState.success, addAddressMsg: message));
      Navigator.pop(event.context);
      add(const AddressesGetEvent());
    });
  }
}
