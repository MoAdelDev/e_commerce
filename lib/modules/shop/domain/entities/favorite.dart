import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final int id;
  final int productId;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String name;
  final String image;

  const Favorite(this.id, this.productId, this.price, this.oldPrice, this.discount, this.name, this.image);

  @override
  List<Object> get props => [id, productId];

}