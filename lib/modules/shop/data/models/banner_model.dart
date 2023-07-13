import 'package:e_commerce_app/modules/shop/domain/entities/banner.dart';

class BannerModel extends BannerEntity {
  const BannerModel(super.id, super.image);

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        json['id'],
        json['image'],
      );
}
