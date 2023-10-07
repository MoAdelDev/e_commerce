part of 'addresses_bloc.dart';

abstract class AddressesEvent{
  const AddressesEvent();
}

class AddressesGetEvent extends AddressesEvent{
  const AddressesGetEvent ();
}
