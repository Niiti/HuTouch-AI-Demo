import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final Widget? suffixWidget;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.fontSize,
    this.suffixWidget,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: Color.fromRGBO(175, 173, 173, 1),
        ),
        filled: true,
        fillColor: Color.fromRGBO(246, 246, 246, 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(232, 232, 232, 1)),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffixWidget,
      ),
    );
  }
}
