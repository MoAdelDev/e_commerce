import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:flutter/material.dart';

class OrderTitleWidget extends StatelessWidget {
  final String text;
  const OrderTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: AppFonts.boldFont, color: Colors.grey[600]),
    );
  }
}
