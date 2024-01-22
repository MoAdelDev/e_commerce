import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';

import '../entities/order.dart' as order;

abstract class BaseOrdersRepository {
  Future<Either<Failure, String>> validatePromoCode({required String code});

  Future<Either<Failure, List<Address>>> getAddresses();

  Future<Either<Failure, String>> addOrder(
      {required int addressId, required bool isPaymentMethod});

  Future<Either<Failure, List<order.Order>>> getOrders();

  Future<Either<Failure, OrderDetails>> getOrderDetails({required int orderId});

  Future<Either<Failure, String>> cancelOrder({required int orderId});
}
