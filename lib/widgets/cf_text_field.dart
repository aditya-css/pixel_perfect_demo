import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfTextField extends StatelessWidget {
  const CfTextField({
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.textInputType,
    this.autofillHints,
    this.controller,
    this.onChange,
    super.key,
  });

  final String hint;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueSetter<String>? onChange;
  final Iterable<String>? autofillHints;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: AppNumberConstants.textFieldSuffixSize,
        ),
      ),
    );
  }
}
