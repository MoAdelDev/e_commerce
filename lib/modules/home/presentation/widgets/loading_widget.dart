import 'package:flutter/material.dart';

import '../../../../core/style/components/default_progress_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: DefaultProgressIndicator(
      size: 70.0,
    ));
  }
}
