import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionTap;
  const SectionHeader({super.key, required this.title, required this.actionText, required this.onActionTap});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Row(
      children: [
        Expanded(
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: h * 2.15, color: AppColors.textPrimary)),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onActionTap,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: EdgeInsets.all(h * 0.6),
              child: Text(actionText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: h * 1.6, color: AppColors.primary)),
            ),
          ),
        ),
      ],
    );
  }
}
