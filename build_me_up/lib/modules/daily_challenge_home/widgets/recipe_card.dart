import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    required this.kcal,
    required this.asset,
    this.onTap,
  });

  final String title;
  final int kcal;
  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.heightUnit * 1.2);
    final cardWidth = context.widthUnit * 44.0;
    final imageHeight = context.heightUnit * 12.5;

    return SizedBox(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: AppColors.accentGreen,
            borderRadius: radius,
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: radius,
                ),
                padding: EdgeInsets.all(context.widthUnit * 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        context.heightUnit * 1.0,
                      ),
                      child: SizedBox(
                        height: imageHeight,
                        child: Image.asset(asset, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: context.heightUnit * 1.5),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w700,
                        fontSize: context.heightUnit * 1.6,
                      ),
                    ),
                    SizedBox(height: context.heightUnit * 0.6),
                    Text(
                      '[0m$kcal Kcal',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w400,
                        fontSize: context.heightUnit * 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
