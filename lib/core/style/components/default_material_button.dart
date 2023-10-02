import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String text;

  const DefaultButton({Key? key, required this.onPressed, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.5.w,
      height: 50.0,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColorDark.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MyApp.isArabic ? 25 : 10.0).r,
              topRight:Radius.circular(MyApp.isArabic ? 10 : 25.0).r,
              bottomLeft: const Radius.circular(25.0).r,
              bottomRight: const Radius.circular(25.0).r,
            )
        ),
        child:  Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            Icon(icon, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
