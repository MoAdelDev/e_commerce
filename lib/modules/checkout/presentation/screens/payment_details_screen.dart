import 'package:e_commerce_app/modules/checkout/presentation/widgets/payment_details_body.dart';
import 'package:flutter/material.dart';

class PayemtDetailsScreen extends StatelessWidget {
  const PayemtDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: PaymentDetailsBody(),
      ),
    );
  }
}
