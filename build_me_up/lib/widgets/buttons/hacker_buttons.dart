import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_durations.dart';

enum PrimaryButtonVariant { filled, outlined }

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final double height;
  final BorderRadius borderRadius;
  final Widget? icon;
  final TextStyle? textStyle;
  final PrimaryButtonVariant variant;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.borderRadius,
    this.enabled = true,
    this.icon,
    this.textStyle,
    this.variant = PrimaryButtonVariant.filled,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        variant == PrimaryButtonVariant.filled
            ? AppColors.primaryButton
            : Colors.transparent;
    final fgColor =
        variant == PrimaryButtonVariant.filled
            ? AppColors.textOnPrimary
            : AppColors.primaryButton;
    final borderSide =
        variant == PrimaryButtonVariant.outlined
            ? BorderSide(color: AppColors.primaryButton, width: 1.5)
            : BorderSide.none;

    final effectiveTextStyle = (textStyle ??
            TextStyle(fontWeight: FontWeight.w600, fontSize: height * 0.45))
        .copyWith(color: fgColor);

    return Opacity(
      opacity: enabled ? 1.0 : 0.6,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        ),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          child: AnimatedContainer(
            duration: AppDurations.short,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: 8)],
                Flexible(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: effectiveTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
