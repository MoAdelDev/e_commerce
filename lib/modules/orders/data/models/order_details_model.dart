import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel(
    super.id,
    super.total,
    super.date,
    super.status,
    super.address,
    super.products,
  );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        json['id'],
        json['total'],
        json['date'],
        json['status'],
        AddressModel.fromJson(json['address']),
        List.from(json['products'] as List)
            .map((e) => OrderProductModel.fromJson(e))
            .toList(),
      );
}

class OrderProductModel extends OrderProduct {
  const OrderProductModel(
      super.id, super.quantity, super.price, super.name, super.image);

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        json['id'],
        json['quantity'],
        json['price'],
        json['name'],
        json['image'],
      );
}
