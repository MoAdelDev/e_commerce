import 'package:e_commerce_app/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIcon;
  final Function(String)? onSubmit;
  final bool? obscureText;
  final String errorMsg;
  final TextInputType keyboardType;
  final bool? isNextTabEnable;

  const DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText,
    required this.errorMsg,
    required this.keyboardType,
    this.isNextTabEnable = true,
    this.onSuffixIcon,
    this.suffixIcon,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmit,
        textInputAction: isNextTabEnable! ? TextInputAction.next : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0).r,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.0.sp,
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIcon,
          ),
        ),
        style: Theme.of(context).textTheme.bodySmall,
        maxLines: 1,
        textAlign: TextAlign.start,
        obscureText: obscureText ?? false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMsg;
          }
          return null;
        },
      ),
    );
  }
}
