import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/checkout/presentation/screens/payment_details_screen.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/order_confirmation/order_confirmation_bloc.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_addresses_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_products_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_summary_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final ScreenArgs args;

  const OrderConfirmationScreen({
    super.key,
    required this.args,
  });

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<OrderConfirmationBloc>()
        .add(const OrderConfirmationStateGetAddressesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(S.of(context).confirmOrderTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: DefaultScrollPhysics.defaultPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderSummaryWidget(
                      args: widget.args,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const OrderPaymentMethodWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const OrderAddressesWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    OrderProductsWidget(
                      args: widget.args,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            BlocBuilder<OrderConfirmationBloc, OrderConfirmationState>(
              builder: (context, state) {
                if (state.addOrderState == RequestState.loading) {
                  return const Center(
                    child: DefaultProgressIndicator(
                      size: 40.0,
                    ),
                  );
                }
                return DefaultButton(
                  onPressed: () {
                    if (state.paymentSelected == 0) {
                      if (state.addressId == 0) {
                        showToast(
                            msg: 'Add address to deliver you the order',
                            requestState: RequestState.nothing);
                      } else {
                        context.read<OrderConfirmationBloc>().add(
                              OrderConfirmationAddOrderEvent(
                                addressId: state.addressId,
                                context: context,
                                isPaymentMethod: false,
                              ),
                            );
                      }
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentDetailsScreen(
                            addressId: state.addressId,
                            totalPrice: widget.args.totalPrice,
                          ),
                        ),
                      );
                    }
                  },
                  text: S.of(context).confirmOrderTitle,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
