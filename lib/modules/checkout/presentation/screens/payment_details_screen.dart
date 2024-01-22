import 'package:e_commerce_app/modules/checkout/presentation/widgets/payment_details_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final int addressId;
  final String totalPrice;

  const PaymentDetailsScreen(
      {super.key, required this.addressId, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PaymentDetailsBody(
          addressId: addressId,
          totalPrice: totalPrice,
        ),
      ),
    );
  }
}
