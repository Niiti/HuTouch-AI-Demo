import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_images.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/modules/home/presentation/views/recipe_detail_view.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class PopularRecipesList extends StatelessWidget {
  final List<Recipe> items;
  const PopularRecipesList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    final cardWidth = context.screenWidth * 0.62;
    final cardHeight = context.heightUnit * 22;
    return SizedBox(
      height: cardHeight + context.heightUnit * 11.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: context.widthUnit * 4),
        itemBuilder: (_, i) {
          final item = items[i];
          return SizedBox(
            width: cardWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(context.widthUnit * 3),
                  clipBehavior: Clip.antiAlias,
                  color: AppColors.cardBg,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => RecipeDetailView(recipe: item)),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: cardWidth,
                          height: cardHeight,
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),
                        Positioned(
                          right: context.widthUnit * 3,
                          top: context.heightUnit * 1.6,
                          child: Material(
                            color: Colors.white,
                            shadowColor: AppColors.navShadow,
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.widthUnit * 1.4)),
                            child: Padding(
                              padding: EdgeInsets.all(context.widthUnit * 2),
                              child: Image.asset(AppImages.favourite, width: context.widthUnit * 5, height: context.widthUnit * 5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.heightUnit * 1.8),
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: context.heightUnit * 1.9, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
                SizedBox(height: context.heightUnit * 1.2),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.calories, width: context.widthUnit * 5, height: context.widthUnit * 5),
                          SizedBox(width: context.widthUnit * 2),
                          Text('${item.calories} ${AppStrings.kcal}', style: TextStyle(color: AppColors.textSecondary, fontSize: context.heightUnit * 1.6)),
                        ],
                      ),
                      VerticalDivider(color: AppColors.textSecondary.withOpacity(0.6), thickness: 1, width: context.widthUnit * 8),
                      Row(
                        children: [
                          Container(
                            width: context.widthUnit * 5,
                            height: context.widthUnit * 5,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.textSecondary)),
                          ),
                          SizedBox(width: context.widthUnit * 2),
                          Text('${item.minutes} ${AppStrings.min}', style: TextStyle(color: AppColors.textSecondary, fontSize: context.heightUnit * 1.6)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
