part of 'login_bloc.dart';

abstract class LoginBaseEvent extends Equatable {
  const LoginBaseEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends LoginBaseEvent {
  final String email;
  final String password;
  final String loginSuccess;

  const LoginEvent(this.email, this.password, this.loginSuccess);
}

class LoginShowPasswordEvent extends LoginBaseEvent {}
