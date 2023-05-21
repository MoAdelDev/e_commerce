import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String image;

  const Banner(this.id, this.image);

  @override
  List<Object> get props => [id, image];
}
