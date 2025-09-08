import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/daily_challenge_home/controllers/home_controller.dart';
import 'package:build_me_up/modules/daily_challenge_home/models/recipe_model.dart';
import 'package:build_me_up/modules/recipes_list/views/recipes_list_view.dart';

class RecipesHorizontalList extends GetView<HomeController> {
  const RecipesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = context.screenWidth * 0.44;
    final cardHeight = context.heightUnit * 23;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthUnit * 4,
            vertical: context.heightUnit * 2.2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.recipes,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: context.heightUnit * 2.2,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Get.to(() => const RecipesListView()),
                  child: Padding(
                    padding: EdgeInsets.all(context.widthUnit * 1.2),
                    child: Text(
                      AppStrings.seeMore,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: context.heightUnit * 2.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: cardHeight + context.heightUnit * 4,
          child: Scrollbar(
            thumbVisibility: false,
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: context.widthUnit * 4,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: controller.recipes.length,
                separatorBuilder:
                    (_, __) => SizedBox(width: context.widthUnit * 4),
                itemBuilder: (context, index) {
                  final recipe = controller.recipes[index];
                  return _RecipeCard(
                    recipe: recipe,
                    width: cardWidth,
                    height: cardHeight,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final double width;
  final double height;

  const _RecipeCard({
    required this.recipe,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mintSurface,
        borderRadius: BorderRadius.circular(context.heightUnit * 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.heightUnit * 1.2),
                topRight: Radius.circular(context.heightUnit * 1.2),
              ),
              child: Image.asset(recipe.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthUnit * 3,
              vertical: context.heightUnit * 1.6,
            ),
            child: Text(
              recipe.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: context.heightUnit * 1.9,
                color: AppColors.darkText,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3),
            child: Row(
              children: [
                Container(
                  width: context.widthUnit * 4.2,
                  height: context.widthUnit * 4.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkText, width: 0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: context.widthUnit * 2),
                Text(
                  '${recipe.calories} ${AppStrings.kcal}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: context.heightUnit * 1.8,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
