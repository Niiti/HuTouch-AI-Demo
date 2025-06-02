import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String value;
  final String placeholder;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;
  const InputField({
    super.key,
    required this.label,
    required this.value,
    required this.placeholder,
    this.leftIcon,
    this.rightIcon,
    this.onRightIconTap,
    this.inputType = TextInputType.text,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        prefixIcon: leftIcon == null ? null : Icon(leftIcon),
        suffixIcon: rightIcon == null
            ? null
            : GestureDetector(onTap: onRightIconTap, child: Icon(rightIcon)),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      keyboardType: inputType,
      onChanged: onChanged,
    );
  }
}