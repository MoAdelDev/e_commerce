import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ScreenArgs extends Equatable {
  late int productId;
  late int categoryId;
  late String categoryName;

  late int addressId;
  late String addressName;
  late String addressDetails;
  late String addressNotes;
  late String addressCity;
  late String addressRegion;

  ScreenArgs.toProductDetails(this.productId);

  ScreenArgs.toCategoryDetails(this.categoryId, this.categoryName);

  ScreenArgs.toAddAndEditAddressScreen(
    this.addressId,
    this.addressName,
    this.addressDetails,
    this.addressNotes,
    this.addressCity,
    this.addressRegion,
  );

  @override
  List<Object> get props => [productId];
}
