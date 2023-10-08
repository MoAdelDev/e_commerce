import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/fonts.dart';

class OrderPaymentMethodWidget extends StatelessWidget {
  const OrderPaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleWidget(text: S.of(context).paymentMethodTitle),
        SizedBox(
          width: double.infinity,
          child: Card(
            color: Theme.of(context).colorScheme.surface,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.clean_hands,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).cashOnDeliveryTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: AppFonts.boldFont,
                                    ),
                              ),
                              Text(
                                S.of(context).cashOnDeliveryBody,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
