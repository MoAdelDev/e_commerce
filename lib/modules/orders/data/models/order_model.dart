import 'package:e_commerce_app/modules/orders/domain/entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.totalPrice,
    required super.date,
    required super.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        totalPrice: json['total'],
        date: json['date'],
        status: json['status'],
      );
}
