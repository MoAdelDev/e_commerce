import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final String phone;
  final String image;
  final String email;
  final String password;

  const Register(this.name, this.phone, this.image, this.email, this.password);

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'image': image
      };

  @override
  List<Object> get props => [name, phone, image, email, password];
}
