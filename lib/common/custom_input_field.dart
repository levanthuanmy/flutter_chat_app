import 'package:flutter/material.dart';

import '../constants/ui_constant.dart';

class CustomInputField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String errorText;
  final bool isValidate;

  const CustomInputField({
    Key? key,
    required this.controller,
    this.suffixIcon,
    this.errorText = "",
    this.hintText,
    this.obscureText = false,
    this.isValidate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: !isValidate ? errorText : null,
        hintText: hintText,
        hintStyle: TextStyle(color: UIConstant.secondary),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(UIConstant.borderRadius),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
