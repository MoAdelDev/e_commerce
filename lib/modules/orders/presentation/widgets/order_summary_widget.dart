import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../../../../core/style/fonts.dart';

class OrderSummaryWidget extends StatelessWidget {
  final TextEditingController _promoCodeController = TextEditingController();
  OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderTitleWidget(text: 'Order summary'),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: SizedBox(
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Item's total (1)",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                "EGP 1000.00",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Delivery fees",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                "Free",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const OrderDividerWidget(),
                          Row(
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: AppFonts.boldFont,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                "EGP 16000",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: AppFonts.boldFont,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const OrderDividerWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultTextFormField(
                              controller: _promoCodeController,
                              hintText: 'Enter code here',
                              prefixIcon: Icons.card_giftcard,
                              errorMsg: 'Enter code here',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'APPLY',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColorDark.primaryColor,
                                      fontFamily: AppFonts.boldFont),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
