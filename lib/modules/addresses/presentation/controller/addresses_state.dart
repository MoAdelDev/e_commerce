part of 'addresses_bloc.dart';

class AddressesState extends Equatable {
  final List<Address> addresses;
  final RequestState addressesState;
  final String addressesError;

  final String addAddressMsg;
  final RequestState addAddressState;
  final String addAddressError;

  const AddressesState({
    this.addresses = const [],
    this.addressesState = RequestState.loading,
    this.addressesError = '',
    this.addAddressMsg = '',
    this.addAddressState = RequestState.nothing,
    this.addAddressError = '',
  });

  AddressesState copyWith({
    List<Address>? addresses,
    RequestState? addressesState,
    String? addressesError,
    String? addAddressMsg,
    RequestState? addAddressState,
    String? addAddressError,
  }) =>
      AddressesState(
        addresses: addresses ?? this.addresses,
        addressesState: addressesState ?? this.addressesState,
        addressesError: addressesError ?? this.addressesError,
        addAddressMsg: addAddressMsg ?? this.addAddressMsg,
        addAddressState: addAddressState ?? this.addAddressState,
        addAddressError: addAddressError ?? this.addAddressError,
      );

  @override
  List<Object> get props => [
        addresses,
        addressesState,
        addressesError,
        addAddressMsg,
        addAddressState,
        addAddressError,
      ];
}
