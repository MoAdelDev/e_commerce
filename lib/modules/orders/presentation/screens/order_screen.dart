import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_products_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_summary_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_payment_method_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Confirm order'),
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
                    OrderSummaryWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const OrderPaymentMethodWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            OrderTitleWidget(text: S.of(context).addressTitle),
                            const Spacer(),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RouteConst.addressScreen),
                              child: Text(
                                'CHANGE',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColorLight.primaryColor,
                                        fontFamily: AppFonts.boldFont),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Address name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: AppFonts.boldFont,
                                              ),
                                        ),
                                        Text(
                                          'COD is a type of transaction where the ',
                                          style:
                                              Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const OrderProductsWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            DefaultButton(onPressed: (){}, text: 'Confirm order')
          ],
        ),
      ),
    );
  }

  defaultDivider() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Divider(
          height: 3.0,
          thickness: 1.0,
          color: MyApp.isDark ? Colors.grey[900] : Colors.grey[300],
        ),
      );
}
