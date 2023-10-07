part of 'addresses_bloc.dart';

class AddressesState extends Equatable {
  final List<Address> addresses;
  final RequestState addressesState;
  final String addressesError;

  const AddressesState({
    this.addresses = const [],
    this.addressesState = RequestState.loading,
    this.addressesError = '',
  });

  AddressesState copyWith({
    List<Address>? addresses,
    RequestState? addressesState,
    String? addressesError,
  }) =>
      AddressesState(
        addresses: addresses ?? this.addresses,
        addressesState: addressesState ?? this.addressesState,
        addressesError: addressesError ?? this.addressesError,
      );

  @override
  List<Object> get props => [
        addresses,
        addressesState,
        addressesError,
      ];
}
