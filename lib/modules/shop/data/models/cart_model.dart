import 'package:e_commerce_app/modules/shop/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel(
    super.id,
    super.quantity,
    super.productId,
    super.price,
    super.oldPrice,
    super.discount,
    super.image,
    super.name,
    super.description,
    super.images,
    super.inFavorites,
    super.inCarts,
  );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      json['id'],
      json['quantity'],
      json['product']['id'],
      json['product']['price'],
      json['product']['old_price'],
      json['product']['discount'],
      json['product']['image'],
      json['product']['name'],
      json['product']['description'],
      json['product']['images'],
      json['product']['in_favorites'],
      json['product']['in_cart']);
}
