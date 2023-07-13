import 'package:e_commerce_app/modules/shop/domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  const FavoriteModel(super.id, super.productId, super.price, super.oldPrice,
      super.discount, super.name, super.image);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        json['id']??0,
        json['product']['id']??0,
        json['product']['price']??0,
        json['product']['old_price']??0,
        json['product']['discount']?? 0,
        json['product']['name'] ?? '',
        json['product']['image'] ?? '',
      );
}
