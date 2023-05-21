import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  const FavoriteModel(super.id, super.productId);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      FavoriteModel(json['id'], json['product']['id']);
}
