import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  final int id;
  final dynamic total;
  final String date;
  final String status;
  final Address address;
  final List<OrderProduct> products;

  const OrderDetails(
      this.id, this.total, this.date, this.status, this.address, this.products);

  @override
  List<Object> get props => [id, total, date, status, address, products];
}

class OrderProduct extends Equatable {
  final int id;
  final int quantity;
  final dynamic price;
  final String name;
  final String image;

  const OrderProduct(this.id, this.quantity, this.price, this.name, this.image);

  @override
  List<Object> get props => [id, quantity, price, name, image];
}
