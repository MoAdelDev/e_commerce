import 'package:e_commerce_app/modules/home/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(super.id, super.name, super.image);

  factory CategoryModel.fomJson(Map<String, dynamic> json) => CategoryModel(
        json['id'],
        json['name'],
        json['image'],
      );
}
