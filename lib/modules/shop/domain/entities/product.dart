import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final dynamic price, oldPrice;
  final int discount;
  final String image;
  final List<dynamic> images;
  final String name;
  final String description;
  final bool inFavorites, inCart;

  const Product(this.id, this.price, this.oldPrice, this.discount, this.image,
      this.name, this.inFavorites, this.inCart, this.images, this.description);

  @override
  List<Object> get props => [
        id,
        price,
        discount,
        image,
        name,
        inFavorites,
        images,
        description,
      ];
}
