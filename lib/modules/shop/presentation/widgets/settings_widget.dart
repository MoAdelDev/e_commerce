import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:flutter/material.dart';

class SettingsItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const SettingsItemWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColorLight.primaryColor.shade100,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Icon(
                icon,
                color: AppColorLight.primaryColor,
                size: 30.0,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontFamily: AppFonts.boldFont),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColorLight.onBackgroundColor,
            )
          ],
        ),
      ),
    );
  }
}
