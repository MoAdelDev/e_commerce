import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/modules/checkout/data/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/modules/checkout/data/repos/base_checkout_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final BaseCheckoutRepo baseCheckoutRepo;
  CheckoutCubit(this.baseCheckoutRepo) : super(CheckoutInitial());

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(CheckoutLoading());
    final result = await baseCheckoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    result.fold(
        (l) => emit(
              CheckoutError(l.message),
            ),
        (r) => emit(CheckoutSuccess()));
  }

  @override
  void onChange(Change<CheckoutState> change) {
    super.onChange(change);
    if (kDebugMode) {
      log(change.toString());
    }
  }
}
