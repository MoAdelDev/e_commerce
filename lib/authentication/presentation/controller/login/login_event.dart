part of 'login_bloc.dart';

abstract class LoginBaseEvent extends Equatable {
  const LoginBaseEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends LoginBaseEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);
}

class LoginShowPasswordEvent extends LoginBaseEvent {}
