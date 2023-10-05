import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';

class DefaultAnimatedText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const DefaultAnimatedText({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: textStyle!,
          colors: MyApp.isDark ?  [
          Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.error,
            ]:[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.error,
          ],
        ),
      ],
      repeatForever: true,
      isRepeatingAnimation: true,
    );
  }
}
