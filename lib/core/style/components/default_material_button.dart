import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String text;
  final TextStyle? textStyle;

  const DefaultButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColorDark.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                MyApp.language == Language.arabic.name ? 25 : 10.0),
            topRight: Radius.circular(
                MyApp.language == Language.arabic.name ? 10 : 25.0),
            bottomLeft: const Radius.circular(25.0),
            bottomRight: const Radius.circular(25.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: textStyle ?? Theme.of(context).textTheme.labelSmall,
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
