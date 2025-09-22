import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';
import 'package:hackaton_end/features/challenge/controllers/challenge_controller.dart';
import 'package:provider/provider.dart';

class RecipeCarousel extends StatelessWidget {
  const RecipeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return SizedBox(
      height: context.isPortrait ? h * 22 : h * 35,
      child: Selector<ChallengeController, int>(
        selector: (_, c) => c.recipes.length,
        builder: (context, count, _) {
          final recipes = context.watch<ChallengeController>().recipes;
          return Scrollbar(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: w * 1),
              itemBuilder: (ctx, i) {
                final r = recipes[i % recipes.length];
                return _RecipeCard(title: r.title, calories: r.calories.toString(), imagePath: 'assets/${r.imagePath}');
              },
              separatorBuilder: (_, __) => SizedBox(width: w * 3),
              itemCount: recipes.length,
            ),
          );
        },
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final String title;
  final String calories;
  final String imagePath;
  const _RecipeCard({required this.title, required this.calories, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    final width = w * 43;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(h * 1.2),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: h * 1.2),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: h * 1.45, color: AppColors.textPrimary)),
          SizedBox(height: h * 0.6),
          Text('$calories Kcal', style: TextStyle(fontSize: h * 1.35, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}
