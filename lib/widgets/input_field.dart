import 'package:flutter/material.dart';
import 'package:iot_sync/utils/theme/colors.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;

  const InputTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.inputType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
          fillColor: AppColors.textFieldBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textColor.withOpacity(0.6),
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal,
              )),
    );
  }
}
