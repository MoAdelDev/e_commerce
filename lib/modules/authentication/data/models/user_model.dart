
import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      super.id, super.name, super.image, super.phone, super.email, super.token);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        json['id'],
        json['name'],
        json['image'],
        json['phone'],
        json['email'],
        json['token'],
      );
}
