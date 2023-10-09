import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final Widget widget;

  const OrderCardWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 3.0,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: widget),
      ),
    );
  }
}
