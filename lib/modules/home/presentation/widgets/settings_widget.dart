import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';

class SettingsItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final bool? isLanguage;
  final bool? isNightMode;
  final Color? textColor;

  const SettingsItemWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.isLanguage,
    this.isNightMode,
    this.textColor,
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
                color: textColor == null ? AppColorLight.primaryColor.shade100 : AppColorLight.errorColor.withAlpha(50),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Icon(
                icon,
                color: textColor == null ? AppColorLight.primaryColor : AppColorLight.errorColor,
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
                  ?.copyWith(fontFamily: AppFonts.boldFont, color: textColor),
            ),
            const Spacer(),
            if (isLanguage ?? false)
              Text(
                MyApp.language == Language.arabic.name
                    ? S.of(context).arabicTitleTitle
                    : S.of(context).englishTitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontFamily: AppFonts.boldFont,
                    ),
              ),
            if (isNightMode ?? false)
              Text(
                MyApp.isDark ? S.of(context).onTitle : S.of(context).offTitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontFamily: AppFonts.boldFont,
                    ),
              ),
            const SizedBox(
              width: 10.0,
            ),
             Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}
