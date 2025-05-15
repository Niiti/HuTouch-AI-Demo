import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';

class AddToCartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool fullWidth;
  final Widget? icon;

  const AddToCartButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.fullWidth = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor =
        isEnabled
            ? ColorPalette.primary
            : ColorPalette.textSecondary.withOpacity(0.6);
    final foregroundColor = ColorPalette.onPrimary;

    final buttonChild =
        icon != null
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                SizedBox(width: size.width * 0.02),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: foregroundColor,
                  ),
                ),
              ],
            )
            : Text(
              text,
              style: TextStyle(
                fontSize: size.height * 0.02,
                color: foregroundColor,
              ),
            );

    final button = ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: fullWidth ? 0 : size.width * 0.04,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.02),
        ),
        minimumSize: fullWidth ? const Size(double.infinity, 0) : null,
      ),
      child: buttonChild,
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    } else {
      return button;
    }
  }
}
