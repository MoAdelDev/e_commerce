import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String name;
  final String note;
  final String city;
  final String region;
  final String details;
  final double latitude;
  final double longitude;

  const Address(
    this.id,
    this.name,
    this.note,
    this.city,
    this.region,
    this.details,
    this.latitude,
    this.longitude,
  );

  @override
  List<Object> get props => [
        id,
        name,
        note,
        city,
        region,
        details,
        latitude,
        longitude,
      ];

}
