import 'package:flutter/material.dart';

import '../../../../core/route/route_string.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/fonts.dart';
import '../../../../generated/l10n.dart';
import 'order_title_widget.dart';

class OrderAddressesWidget extends StatelessWidget {
  const OrderAddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            OrderTitleWidget(text: S.of(context).addressTitle),
            const Spacer(),
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RouteConst.addressScreen),
              child: Text(
                'CHANGE',
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address name',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: AppFonts.boldFont,
                                  ),
                        ),
                        Text(
                          'COD is a type of transaction where the ',
                          style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}
