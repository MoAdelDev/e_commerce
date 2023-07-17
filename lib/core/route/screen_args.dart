import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ScreenArgs extends Equatable {
  late int productId;
  late int categoryId;
  late String categoryName;

  ScreenArgs.toProductDetails(this.productId);

  ScreenArgs.toCategoryDetails(this.categoryId, this.categoryName);

  @override
  List<Object> get props => [productId];
}
