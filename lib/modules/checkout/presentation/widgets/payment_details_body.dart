import 'dart:developer';

import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/services/stripe_service.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/modules/checkout/controller/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/modules/checkout/data/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/modules/checkout/data/repos/checkout_repo.dart';
import 'package:e_commerce_app/modules/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/order_confirmation/order_confirmation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailsBody extends StatefulWidget {
  final int addressId;
  final String totalPrice;
  const PaymentDetailsBody(
      {super.key, required this.addressId, required this.totalPrice});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CheckoutCubit(CheckoutRepo(StripeService(ApiService()))),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: _formKey,
              autoValidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: BlocConsumer<CheckoutCubit, CheckoutState>(
                listener: (context, state) {
                  if (state is CheckoutError) {
                    showToast(
                      msg: state.errorMessage,
                      requestState: RequestState.error,
                    );
                    log(state.errorMessage);
                  }
                  if (state is CheckoutSuccess) {
                    showToast(
                        msg: 'Payment Done Successfully',
                        requestState: RequestState.success);
                    BlocProvider.of<OrderConfirmationBloc>(context).add(
                      OrderConfirmationAddOrderEvent(
                        addressId: widget.addressId,
                        context: context,
                        isPaymentMethod: true,
                      ),
                    );
                    if (mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteConst.homeScreen,
                        (route) => false,
                      );
                    }
                  }
                },
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return const Center(
                      child: DefaultProgressIndicator(),
                    );
                  }
                  return DefaultButton(
                    onPressed: () {
                      PaymentIntentInputModel paymentIntentInputModel =
                          PaymentIntentInputModel(
                        double.parse(widget.totalPrice).toInt().toString(),
                        'USD',
                        CacheHelper.getString(key: 'customer_id') ?? '',
                      );
                      BlocProvider.of<CheckoutCubit>(context).makePayment(
                        paymentIntentInputModel: paymentIntentInputModel,
                      );
                    },
                    text: 'Payment',
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
