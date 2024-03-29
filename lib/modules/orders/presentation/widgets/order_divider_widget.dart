import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:flutter/material.dart';

class OrderDividerWidget extends StatelessWidget {
  const OrderDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Divider(
        height: 3.0,
        thickness: 1.0,
        color: AppData.isDark ? Colors.grey[900] : Colors.grey[300],
      ),
    );
  }
}
