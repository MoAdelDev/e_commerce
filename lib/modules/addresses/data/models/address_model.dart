import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel(
    super.id,
    super.name,
    super.note,
    super.city,
    super.region,
    super.details,
    super.latitude,
    super.longitude,
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        json['id'],
        json['name'],
        json['notes'],
        json['city'],
        json['region'],
        json['details'],
        json['latitude'],
        json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'city': name,
        'region': name,
        'details': name,
        'latitude': name,
        'longitude': name,
        'notes': note,
      };
}
