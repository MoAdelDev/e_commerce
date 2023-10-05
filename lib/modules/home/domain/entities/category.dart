import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;

  const Category(this.id, this.name, this.image);

  @override
  List<Object> get props => [id, name, image];
}
