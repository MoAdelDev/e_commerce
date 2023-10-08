import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final dynamic price;
  final String image;
  final String name;

  const Search(
    this.id,
    this.price,
    this.image,
    this.name,
  );

  @override
  List<Object> get props => [
        id,
        price,
        image,
        name,
      ];
}
