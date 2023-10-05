import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel(
    super.products,
    super.totalPrice,
  );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        List.from((json['cart_items'] as List)
            .map((e) => ProductCartModel.fromJson(e))),
        json['total'],
      );
}

class ProductCartModel extends ProductCart {
  const ProductCartModel(
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
      super.inCarts);

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
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
