import 'package:flutter/material.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class PrimaryActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool disabled;
  final IconData? icon;
  const PrimaryActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        icon: icon == null
            ? const SizedBox.shrink()
            : Icon(icon, color: Colors.white),
        label: loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          minimumSize: const Size.fromHeight(48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 0,
        ),
        onPressed: disabled || loading ? null : onPressed,
      ),
    );
  }
}