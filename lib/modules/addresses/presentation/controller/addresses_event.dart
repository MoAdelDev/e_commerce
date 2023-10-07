part of 'addresses_bloc.dart';

abstract class AddressesEvent extends Equatable {
  const AddressesEvent();
}

class AddressesGetEvent extends AddressesEvent {
  const AddressesGetEvent();

  @override
  List<Object> get props => [];
}

class AddressesAddEvent extends AddressesEvent {
  final String name;
  final String address;
  final String notes;
  final String city;
  final String region;
  final BuildContext context;

  const AddressesAddEvent(
    this.name,
    this.address,
    this.notes,
    this.city,
    this.region,
    this.context,
  );

  @override
  List<Object> get props => [
        name,
        address,
        notes,
        city,
        region,
        context,
      ];
}

class AddressesUpdateEvent extends AddressesEvent {
  final int addressId;
  final String name;
  final String address;
  final String notes;
  final String city;
  final String region;
  final BuildContext context;

  const AddressesUpdateEvent(
    this.addressId,
    this.name,
    this.address,
    this.notes,
    this.city,
    this.region,
    this.context,
  );

  @override
  List<Object> get props => [
        addressId,
        name,
        address,
        notes,
        city,
        region,
        context,
      ];
}

class AddressesDeleteEvent extends AddressesEvent {
  final int addressId;
  final BuildContext context;

  const AddressesDeleteEvent(this.addressId, this.context);

  @override
  List<Object> get props => [
        addressId,
        context,
      ];
}
