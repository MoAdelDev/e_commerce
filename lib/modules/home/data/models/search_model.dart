import 'package:e_commerce_app/modules/home/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel(
    super.id,
    super.price,
    super.image,
    super.name,
  );

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        json['id'],
        json['price'],
        json['image'],
        json['name'],
      );
}
