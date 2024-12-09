import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String? helperText;

  InputField({
    required this.hintText,
    required this.obscureText,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundColor,
        hintText: hintText,
        helperText: helperText,
        helperStyle: TextStyle(
          fontSize: width * 0.03,
          color: AppColors.helperTextColor,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 16.0), // Adjust padding
        isDense: false, // Ensures no compact layout for better visibility
        helperMaxLines: 5, // Explicitly limit to multiple lines
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: width * 0.045),
    );
  }
}
