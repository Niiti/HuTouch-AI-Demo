import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(recipe.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(context.widthUnit * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.title, style: TextStyle(fontSize: context.heightUnit * 2.6, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                  SizedBox(height: context.heightUnit * 1),
                  Row(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(recipe.authorImage), radius: context.heightUnit * 1.8),
                      SizedBox(width: context.widthUnit * 2),
                      Expanded(child: Text(recipe.authorName, style: TextStyle(fontSize: context.heightUnit * 1.7))),
                      _Chip(text: '${recipe.minutes} Min'),
                      SizedBox(width: context.widthUnit * 2),
                      _Chip(text: '${recipe.calories} Kcal'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  const _Chip({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 0.8),
      decoration: BoxDecoration(
        color: AppColors.chipUnselected,
        borderRadius: BorderRadius.circular(context.widthUnit * 2),
      ),
      child: Text(text, style: TextStyle(color: AppColors.textSecondary, fontSize: context.heightUnit * 1.5)),
    );
  }
}
