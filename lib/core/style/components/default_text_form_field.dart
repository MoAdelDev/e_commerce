import 'package:e_commerce_app/core/style/colors.dart';
import 'package:flutter/material.dart';

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
  final TextInputAction textInputAction;

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
    this.onSubmit, required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmit,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none
          ),
          fillColor: AppColorLight.primaryColor.shade100,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[700]
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIcon,
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
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
