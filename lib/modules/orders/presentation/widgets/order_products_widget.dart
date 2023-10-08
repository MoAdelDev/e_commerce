import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/components/default_shimmer.dart';

class OrderProductsWidget extends StatelessWidget {
  final ScreenArgs args;
  const OrderProductsWidget({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            OrderTitleWidget(text: S.of(context).productsTitle),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                S.of(context).modifyCartTitle.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        args.products[index].image,
                                    errorWidget: (context, url, error) =>
                                        const DefaultShimmer(),
                                    placeholder: (context, url) =>
                                        const DefaultShimmer(),
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          args.products[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '${S.of(context).quantityTitle} -> ${args.products[index].quantity}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const OrderDividerWidget(),
                            itemCount: args.products.length),
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
