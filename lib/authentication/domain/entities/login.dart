import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String email;
  final String password;

  const Login(this.email, this.password);

  Map<String, dynamic> toMap() => {'email': email, 'password': password};


  @override
  List<Object> get props => [email, password];
}
