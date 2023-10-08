import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';

class ScreenArgs {
  late int productId;
  late int categoryId;
  late String categoryName;

  late int addressId;
  late String addressName;
  late String addressDetails;
  late String addressNotes;
  late String addressCity;
  late String addressRegion;

  late int itemsCount;
  late dynamic totalPrice;
  late List<CartProduct> products;

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

  ScreenArgs.toConfirmOrder(
    this.itemsCount,
    this.totalPrice,
    this.products,
  );
}
