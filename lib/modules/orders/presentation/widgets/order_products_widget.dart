import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/components/default_shimmer.dart';

class OrderProductsWidget extends StatelessWidget {
  const OrderProductsWidget({super.key});

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
                'Modify card'.toUpperCase(),
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
                        Text(
                          S.of(context).productsTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontFamily: AppFonts.boldFont),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg',
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
                                          'Apple Mac Os',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'Quantity 5',
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
                            itemCount: 10),
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
