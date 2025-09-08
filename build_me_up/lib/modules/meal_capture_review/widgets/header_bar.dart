import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/shared/components/user-avatar-icon-button.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onProfile;

  const HeaderBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.onProfile,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit * 6.5;

    return SizedBox(
      height: h,
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(h / 2),
              child: Padding(
                padding: EdgeInsets.all(context.widthUnit * 2.2),
                child: Icon(
                  Icons.chevron_left,
                  size: context.heightUnit * 3.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: context.heightUnit * 2.7,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          UserAvatarIconButton(
            onTap: onProfile,
            size: context.heightUnit * 4.4,
            backgroundColor: AppColors.brand,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
