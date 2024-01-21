import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/modules/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:e_commerce_app/modules/checkout/presentation/widgets/payment_method_list.dart';
import 'package:flutter/material.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodList(),
        ),
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
            child: DefaultButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: 'Payment',
            ),
          ),
        )
      ],
    );
  }
}
