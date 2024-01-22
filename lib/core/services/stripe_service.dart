import 'dart:developer';

import 'package:e_commerce_app/core/network/api_keys.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/modules/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:e_commerce_app/modules/checkout/data/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/modules/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;

  StripeService(this.apiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final result = await apiService.postData(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(result.data);
    return paymentIntentModel;
  }

  Future<String> createCustomerId() async {
    final result = await apiService.postData(
      body: null,
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
    );
    log('Id : ${result.data['id']}');
    return result.data['id'];
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
    required String ephemeralKeySecret,
    required String customerId,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerEphemeralKeySecret: ephemeralKeySecret,
        customerId: customerId,
        merchantDisplayName: 'Mohammed Adel',
      ),
    );
  }

  Future displayPayemntSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String customerId,
  }) async {
    var paymentIntetntModel = await createPaymentIntent(
      paymentIntentInputModel,
    );
    var ephemeralKey = await createEphemeralKey(customerId: customerId);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntetntModel.clientSecret ?? '',
      ephemeralKeySecret: ephemeralKey.secret ?? '',
      customerId: customerId,
    );
    await displayPayemntSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    final result = await apiService.postData(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16',
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(result.data);
    return ephemeralKeyModel;
  }
}
