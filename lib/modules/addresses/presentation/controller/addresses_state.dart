part of 'addresses_bloc.dart';

class AddressesState extends Equatable {
  final List<Address> addresses;
  final RequestState addressesState;
  final String addressesError;

  final String addOrUpdateAddressMsg;
  final RequestState addOrUpdateAddressState;
  final String addOrUpdateAddressError;

  final String deleteAddressMsg;
  final RequestState deleteAddressState;
  final String deleteAddressError;

  const AddressesState({
    this.addresses = const [],
    this.addressesState = RequestState.loading,
    this.addressesError = '',
    this.addOrUpdateAddressMsg = '',
    this.addOrUpdateAddressState = RequestState.nothing,
    this.addOrUpdateAddressError = '',
    this.deleteAddressMsg = '',
    this.deleteAddressState = RequestState.nothing,
    this.deleteAddressError = '',
  });

  AddressesState copyWith({
    List<Address>? addresses,
    RequestState? addressesState,
    String? addressesError,
    String? addOrUpdateAddressMsg,
    RequestState? addOrUpdateAddressState,
    String? addOrUpdateAddressError,
    String? deleteAddressMsg,
    RequestState? deleteAddressState,
    String? deleteAddressError,
  }) =>
      AddressesState(
        addresses: addresses ?? this.addresses,
        addressesState: addressesState ?? this.addressesState,
        addressesError: addressesError ?? this.addressesError,
        addOrUpdateAddressMsg:
            addOrUpdateAddressMsg ?? this.addOrUpdateAddressMsg,
        addOrUpdateAddressState:
            addOrUpdateAddressState ?? this.addOrUpdateAddressState,
        addOrUpdateAddressError:
            addOrUpdateAddressError ?? this.addOrUpdateAddressError,
        deleteAddressMsg: addOrUpdateAddressMsg ?? this.deleteAddressMsg,
        deleteAddressState: deleteAddressState ?? this.deleteAddressState,
        deleteAddressError: deleteAddressError ?? this.deleteAddressError,
      );

  @override
  List<Object> get props => [
        addresses,
        addressesState,
        addressesError,
        addOrUpdateAddressMsg,
        addOrUpdateAddressState,
        addOrUpdateAddressError,
        deleteAddressMsg,
        deleteAddressState,
        deleteAddressError,
      ];
}
