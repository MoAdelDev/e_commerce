import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final int id;
  final int productId;

  const Favorite(this.id, this.productId);

  @override
  List<Object> get props => [id, productId];

}