import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/orders_bloc.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../../../../core/style/fonts.dart';

class OrderSummaryWidget extends StatefulWidget {
  final ScreenArgs args;

  const OrderSummaryWidget({super.key, required this.args});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  final TextEditingController _promoCodeController = TextEditingController();
  bool isButtonClickable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleWidget(text: S.of(context).orderSummaryTitle),
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
                                "${S.of(context).itemTotalTitle} ( ${widget.args.itemsCount} )",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                "EGP ${widget.args.totalPrice}",
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
                                S.of(context).deliveryFeesTitle,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                S.of(context).freeTitle,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const OrderDividerWidget(),
                          Row(
                            children: [
                              Text(
                                S.of(context).totalTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: AppFonts.boldFont,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                "EGP ${widget.args.totalPrice}",
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
                              hintText: S.of(context).codeHintTitle,
                              prefixIcon: Icons.card_giftcard,
                              errorMsg: S.of(context).codeHintTitle,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onChange: (value) {
                                if(value.isNotEmpty) {
                                  setState(() {
                                    isButtonClickable = true;
                                  });
                                }
                                else{
                                  setState(() {
                                    isButtonClickable = false;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          BlocBuilder<OrdersBloc, OrdersState>(
                            builder: (context, state) {
                              if(state.validatePromoCodesState == RequestState.loading){
                                return const Center(child: DefaultProgressIndicator(size: 40.0,),);
                              }
                              return TextButton(
                                onPressed: isButtonClickable ? () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if(_promoCodeController.text.isNotEmpty) {
                                    context.read<OrdersBloc>().add(
                                        OrdersValidatePromoCodesEvent(
                                          _promoCodeController.text,
                                        ),
                                      );
                                  }
                                } : null,
                                child: Text(
                                  S.of(context).applyTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: isButtonClickable ? AppColorDark.primaryColor : Colors.grey,
                                          fontFamily: AppFonts.boldFont),
                                ),
                              );
                            },
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
