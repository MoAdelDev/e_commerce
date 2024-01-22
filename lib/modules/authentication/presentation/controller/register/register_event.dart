part of 'register_bloc.dart';

abstract class RegisterBaseEvent extends Equatable {
  const RegisterBaseEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends RegisterBaseEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String registerSuccess;

  const RegisterEvent(
      this.name, this.email, this.phone, this.password, this.registerSuccess);
}

class RegisterShowPasswordEvent extends RegisterBaseEvent {
  const RegisterShowPasswordEvent();
}
