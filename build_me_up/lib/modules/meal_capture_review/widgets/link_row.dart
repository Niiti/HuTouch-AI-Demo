import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class LinkRow extends StatelessWidget {
  final IconData leadingIcon;
  final String label;
  final VoidCallback onTap;

  const LinkRow({
    super.key,
    required this.leadingIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = context.heightUnit * 2.4;

    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(iconSize),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.heightUnit * 1.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(leadingIcon, size: iconSize, color: AppColors.link),
                SizedBox(width: context.widthUnit * 1.5),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: context.heightUnit * 1.9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.link,
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
