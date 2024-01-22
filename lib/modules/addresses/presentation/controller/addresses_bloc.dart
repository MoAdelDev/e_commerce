import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/add_address_usecase.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/delete_address_usecase.dart';
import 'package:e_commerce_app/modules/addresses/domain/usecases/update_address_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/usecases/get_addresses_usecase.dart';
import 'package:geolocator/geolocator.dart';

part 'addresses_event.dart';

part 'addresses_state.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  final GetAddressesUseCase getAddressesUseCase;
  final AddAddressUseCase addAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;

  AddressesBloc(
    this.getAddressesUseCase,
    this.addAddressUseCase,
    this.deleteAddressUseCase,
    this.updateAddressUseCase,
  ) : super(const AddressesState()) {
    on<AddressesGetEvent>(_getAddresses);
    on<AddressesAddEvent>(_addAddress);
    on<AddressesDeleteEvent>(_deleteAddress);
    on<AddressesUpdateEvent>(_updateAddress);
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
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      emit(state.copyWith(addOrUpdateAddressState: RequestState.loading));

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
            addOrUpdateAddressState: RequestState.error,
            addOrUpdateAddressError: error.message));
      }, (message) {
        showToast(msg: message, requestState: RequestState.success);
        emit(state.copyWith(
            addOrUpdateAddressState: RequestState.success,
            addOrUpdateAddressMsg: message));
        Navigator.pop(event.context);
        add(const AddressesGetEvent());
      });
    } else {
      showToast(
          msg: "Enable location permission", requestState: RequestState.error);
    }
  }

  FutureOr<void> _deleteAddress(
      AddressesDeleteEvent event, Emitter<AddressesState> emit) async {
    emit(state.copyWith(deleteAddressState: RequestState.loading));
    final result = await deleteAddressUseCase(addressId: event.addressId);

    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(state.copyWith(
          deleteAddressState: RequestState.error,
          deleteAddressError: error.message));
    }, (message) {
      showToast(msg: message, requestState: RequestState.success);
      add(const AddressesGetEvent());
      emit(state.copyWith(
          deleteAddressState: RequestState.success, deleteAddressMsg: message));
      Navigator.pop(event.context);
    });
  }

  FutureOr<void> _updateAddress(
      AddressesUpdateEvent event, Emitter<AddressesState> emit) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      emit(state.copyWith(addOrUpdateAddressState: RequestState.loading));

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      AddressModel addressModel = AddressModel(
        event.addressId,
        event.name,
        event.notes,
        event.city,
        event.region,
        event.address,
        position.latitude,
        position.longitude,
      );
      final result = await updateAddressUseCase(addressModel: addressModel);
      result.fold((error) {
        showToast(msg: error.message, requestState: RequestState.error);
        emit(state.copyWith(
            addOrUpdateAddressState: RequestState.error,
            addOrUpdateAddressError: error.message));
      }, (message) {
        showToast(msg: message, requestState: RequestState.success);
        emit(state.copyWith(
            addOrUpdateAddressState: RequestState.success,
            addOrUpdateAddressMsg: message));
        Navigator.pop(event.context);
        add(const AddressesGetEvent());
      });
    } else {
      showToast(
          msg: "Enable location permission", requestState: RequestState.error);
    }
  }
}
