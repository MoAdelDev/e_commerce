import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String image;
  final String phone;
  final String email;
  final String token;

  const User(
    this.id,
    this.name,
    this.image,
    this.phone,
    this.email,
    this.token,
  );

  @override
  List<Object> get props => [
        id,
        name,
        image,
        phone,
        email,
        token,
      ];
}
