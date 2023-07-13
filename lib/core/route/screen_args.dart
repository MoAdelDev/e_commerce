import 'package:equatable/equatable.dart';

class ScreenArgs extends Equatable {
  final int productId;

  const ScreenArgs.toProductDetails(this.productId);

  @override
  List<Object> get props => [productId];
}