import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/services/stripe_service.dart';
import 'package:e_commerce_app/modules/checkout/data/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/modules/checkout/data/repos/base_checkout_repo.dart';

class CheckoutRepo extends BaseCheckoutRepo {
  final StripeService stripeService;

  CheckoutRepo(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
        customerId: CacheHelper.getString(key: 'customer_id') ?? '',
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
