import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/constants/app_strings.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';
import 'package:hackaton_end/features/challenge/controllers/challenge_controller.dart';
import 'package:hackaton_end/features/challenge/models/meal.dart';
import 'package:hackaton_end/features/challenge/views/widgets/circular_target_chart.dart';
import 'package:hackaton_end/features/challenge/views/widgets/meal_card.dart';
import 'package:hackaton_end/features/challenge/views/widgets/recipe_carousel.dart';
import 'package:hackaton_end/features/challenge/views/widgets/section_header.dart';
import 'package:hackaton_end/features/profile/views/profile_screen.dart';
import 'package:provider/provider.dart';

class ChallengeMainScreen extends StatefulWidget {
  const ChallengeMainScreen({super.key});

  @override
  State<ChallengeMainScreen> createState() => _ChallengeMainScreenState();
}

class _ChallengeMainScreenState extends State<ChallengeMainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ChallengeController>().getFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 4.7),
          child: Scrollbar(
            thumbVisibility: false,
            child: ListView(
              children: [
                SizedBox(height: h * 2.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppStrings.todaysChallenge,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontSize: h * 3.1),
                      ),
                    ),
                    Material(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(999),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const ProfileScreen()),
                          );
                        },
                        child: SizedBox(
                          width: h * 4.2,
                          height: h * 4.2,
                          child: Icon(Icons.person, color: Colors.white, size: h * 2.4),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 2.2),
                _TargetSection(),
                SizedBox(height: h * 3.0),
                Selector<ChallengeController, Map<MealType, dynamic>>(
                  selector: (_, c) => c.mealStats,
                  builder: (context, stats, _) {
                    return Column(
                      children: [
                        MealCard(
                          color: AppColors.surfaceTint,
                          icon: Icons.free_breakfast,
                          title: stats[MealType.breakfast]!.title,
                          progressText:
                              '${stats[MealType.breakfast]!.consumedCalories}/${stats[MealType.breakfast]!.goalCalories} Cal',
                          onAdd: () => _showAddMealSheet(context, MealType.breakfast),
                        ),
                        SizedBox(height: h * 2.2),
                        MealCard(
                          color: AppColors.surfaceTint,
                          icon: Icons.lunch_dining,
                          title: stats[MealType.lunch]!.title,
                          progressText:
                              '${stats[MealType.lunch]!.consumedCalories}/${stats[MealType.lunch]!.goalCalories} Cal',
                          onAdd: () => _showAddMealSheet(context, MealType.lunch),
                        ),
                        SizedBox(height: h * 2.2),
                        MealCard(
                          color: AppColors.surfaceTint,
                          icon: Icons.cookie_outlined,
                          title: stats[MealType.snack]!.title,
                          progressText:
                              '${stats[MealType.snack]!.consumedCalories}/${stats[MealType.snack]!.goalCalories} Cal',
                          onAdd: () => _showAddMealSheet(context, MealType.snack),
                        ),
                        SizedBox(height: h * 2.2),
                        MealCard(
                          color: AppColors.surfaceTint,
                          icon: Icons.dinner_dining,
                          title: stats[MealType.dinner]!.title,
                          progressText:
                              '${stats[MealType.dinner]!.consumedCalories}/${stats[MealType.dinner]!.goalCalories} Cal',
                          onAdd: () => _showAddMealSheet(context, MealType.dinner),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: h * 3.0),
                SectionHeader(
                  title: AppStrings.recipes,
                  actionText: AppStrings.seeMore,
                  onActionTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => const _AllRecipesScreen()));
                  },
                ),
                SizedBox(height: h * 1.2),
                const RecipeCarousel(),
                SizedBox(height: h * 3.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddMealSheet(BuildContext context, MealType type) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    final caloriesController = TextEditingController();
    final fatController = TextEditingController();
    final proteinController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(bottom: ctx.viewInsetsBottom),
          child: Material(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add ${type.name[0].toUpperCase()}${type.name.substring(1)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: h * 1.5),
                  Row(
                    children: [
                      Expanded(
                        child: _NumField(
                          controller: caloriesController,
                          label: 'Calories',
                        ),
                      ),
                      SizedBox(width: w * 3),
                      Expanded(
                        child: _NumField(controller: fatController, label: 'Fat (g)'),
                      ),
                      SizedBox(width: w * 3),
                      Expanded(
                        child: _NumField(
                          controller: proteinController,
                          label: 'Protein (g)',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 2),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        final calories =
                            int.tryParse(caloriesController.text.trim()) ?? 0;
                        final fat = int.tryParse(fatController.text.trim()) ?? 0;
                        final protein = int.tryParse(proteinController.text.trim()) ?? 0;
                        if (calories <= 0) {
                          Navigator.pop(ctx);
                          return;
                        }
                        context.read<ChallengeController>().addMeal(
                          MealLog(
                            type: type,
                            calories: calories,
                            fat: fat,
                            protein: protein,
                          ),
                        );
                        Navigator.pop(ctx);
                      },
                      child: const Text('Next'),
                    ),
                  ),
                  SizedBox(height: h * 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TargetSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceTint,
        borderRadius: BorderRadius.circular(h * 2.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: w * 4, vertical: h * 2.5),
      child: Selector<ChallengeController, dynamic>(
        selector: (_, c) => c.summary,
        builder: (context, summary, _) {
          return Row(
            children: [
              Expanded(
                flex: 7,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularTargetChart(
                    caloriesProgress: summary.caloriesProgress.clamp(0.0, 1.0),
                    caloriesTextTop:
                        '${AppStrings.target}\n${summary.targetCalories} ${AppStrings.kcal}',
                  ),
                ),
              ),
              SizedBox(width: w * 5),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MacroItem(
                      circleText: '${summary.consumedFat}/\n${summary.targetFat}g',
                      label: AppStrings.fat,
                      progress: summary.fatProgress.clamp(0.0, 1.0),
                    ),
                    SizedBox(height: h * 3.0),
                    _MacroItem(
                      circleText:
                          '${summary.consumedProtein}/\n${summary.targetProtein}g',
                      label: AppStrings.protein,
                      progress: summary.proteinProgress.clamp(0.0, 1.0),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MacroItem extends StatelessWidget {
  final String circleText;
  final String label;
  final double progress;

  const _MacroItem({
    required this.circleText,
    required this.label,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Row(
      children: [
        SizedBox(
          width: w * 16,
          height: w * 16,
          child: CustomPaint(
            painter: _MiniRingPainter(progress: progress),
            child: Center(
              child: Text(
                circleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: h * 1.4,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: w * 4),
        Text(
          label,
          style: TextStyle(
            fontSize: h * 1.8,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _MiniRingPainter extends CustomPainter {
  final double progress;

  _MiniRingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * 0.08;
    final rect = Offset.zero & size;
    final bg =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..color = AppColors.primaryLight;
    final fg =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = stroke
          ..color = AppColors.primary;
    canvas.drawArc(rect.deflate(stroke / 2), -3.14 / 2, 2 * 3.14, false, bg);
    canvas.drawArc(rect.deflate(stroke / 2), -3.14 / 2, 2 * 3.14 * progress, false, fg);
  }

  @override
  bool shouldRepaint(covariant _MiniRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _NumField({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: '',
        hintText: '',
        border: OutlineInputBorder(),
        isDense: true,
      ).copyWith(labelText: label),
    );
  }
}

class _AllRecipesScreen extends StatelessWidget {
  const _AllRecipesScreen();

  @override
  Widget build(BuildContext context) {
    final w = context.widthUnit;
    final h = context.heightUnit;
    final recipes = context.watch<ChallengeController>().recipes;
    return Scaffold(
      appBar: AppBar(title: const Text('All Recipes')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(w * 4),
          child: Scrollbar(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isPortrait ? 2 : 4,
                mainAxisSpacing: h * 2,
                crossAxisSpacing: w * 3,
                childAspectRatio: 1,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final r = recipes[index];
                print("prueba");
                return Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(h * 1.2),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/${r.imagePath}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(w * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 1.45,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: h * 0.6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_box_outline_blank,
                                    size: h * 1.5,
                                    color: AppColors.textPrimary,
                                  ),
                                  SizedBox(width: w * 1.5),
                                  Text(
                                    '${r.calories} Kcal',
                                    style: TextStyle(
                                      fontSize: h * 1.35,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
