import 'package:e_commerce_app/modules/home/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
    super.id,
    super.price,
    super.oldPrice,
    super.discount,
    super.image,
    super.name,
    super.inFavorites,
    super.inCart,
    super.images,
    super.description,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        json['id'],
        json['price'],
        json['old_price'],
        json['discount'],
        json['image'],
        json['name'],
        json['in_favorites'],
        json['in_cart'],
        json['images'],
        json['description'],
      );
}
