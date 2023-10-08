import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final dynamic totalPrice;
  final String date;
  final String status;

  const Order({
    required this.id,
    required this.totalPrice,
    required this.date,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        totalPrice,
        date,
        status,
      ];
}
