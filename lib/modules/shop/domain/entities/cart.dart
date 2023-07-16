import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int id;
  final int quantity;
  final int productId;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<dynamic> images;
  final bool inFavorites;
  final bool inCarts;

  const Cart(this.id, this.quantity, this.productId, this.price, this.oldPrice,
      this.discount, this.image, this.name, this.description,
      this.images, this.inFavorites, this.inCarts);

  @override
  List<Object> get props =>
      [
        id,
        quantity,
        productId,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
        images,
        inFavorites,
        inCarts,
      ];
}
