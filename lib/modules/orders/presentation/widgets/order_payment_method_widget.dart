import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/order_confirmation/order_confirmation_bloc.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_payment_method_item.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPaymentMethodWidget extends StatefulWidget {
  const OrderPaymentMethodWidget({super.key});

  @override
  State<OrderPaymentMethodWidget> createState() =>
      _OrderPaymentMethodWidgetState();
}

class _OrderPaymentMethodWidgetState extends State<OrderPaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderConfirmationBloc, OrderConfirmationState>(
      builder: (context, state) {
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: 0,
                              groupValue: state.paymentSelected,
                              onChanged: (value) {
                                context.read<OrderConfirmationBloc>().add(
                                      const OrderConfirmationChangePayemntMethodEvent(
                                        0,
                                      ),
                                    );
                              },
                            ),
                            Expanded(
                              child: OrderPaymentMethodItem(
                                icon: Icons.clean_hands,
                                title: S.of(context).cashOnDeliveryTitle,
                                body: S.of(context).cashOnDeliveryBody,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: state.paymentSelected,
                              onChanged: (value) {
                                context.read<OrderConfirmationBloc>().add(
                                      const OrderConfirmationChangePayemntMethodEvent(
                                          1),
                                    );
                              },
                            ),
                            const Expanded(
                              child: OrderPaymentMethodItem(
                                icon: Icons.payment,
                                title: 'Payment',
                                body:
                                    'Payment method via paypal or master card',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
