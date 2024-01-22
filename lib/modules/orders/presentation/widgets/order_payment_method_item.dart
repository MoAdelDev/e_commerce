import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:flutter/material.dart';

class OrderPaymentMethodItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const OrderPaymentMethodItem({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
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
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: AppFonts.boldFont,
                    ),
              ),
              Text(
                body,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
