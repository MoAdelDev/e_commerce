import 'package:e_commerce_app/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DefaultButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColorLight.primaryColor,
          borderRadius: BorderRadius.circular(10.0).r),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0).r,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
