import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:flutter/material.dart';

class TestLayout extends StatelessWidget {
  const TestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(child: DefaultSpinKit(),),
    );
  }
}
