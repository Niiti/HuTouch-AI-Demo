import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class MealRowItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onAdd;

  const MealRowItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final iconBg = Container(
      width: context.widthUnit * 12,
      height: context.widthUnit * 12,
      decoration: const BoxDecoration(
        color: AppColors.mintSurface,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary, size: context.widthUnit * 7),
    );

    final textStyleTitle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
      fontSize: context.heightUnit * 2.0,
    );

    final textStyleSub = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.darkText,
      fontSize: context.heightUnit * 1.7,
    );

    final addBtnSize = context.widthUnit * 12;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.heightUnit * 1.2),
      child: IntrinsicHeight(
        child: Row(
          children: [
            iconBg,
            SizedBox(width: context.widthUnit * 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyleTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.heightUnit * 0.6),
                  Text(
                    subtitle,
                    style: textStyleSub,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: context.widthUnit * 3),
            SizedBox(
              width: addBtnSize,
              height: addBtnSize,
              child: Material(
                color: AppColors.plusBtn,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onAdd,
                  child: Icon(
                    Icons.add,
                    color: AppColors.plusIcon,
                    size: addBtnSize * 0.55,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
