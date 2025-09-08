import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/core/constants/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CloseIconButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Close',
      button: true,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(AppDimensions.rM),
        child: InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(AppDimensions.s),
            child: Icon(Icons.close, color: AppColors.textPrimary, size: 24),
          ),
        ),
      ),
    );
  }
}
