import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/modules/home/presentation/views/recipe_detail_view.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class FeaturedCarousel extends StatelessWidget {
  final bool isPortrait;
  final List<Recipe> items;
  const FeaturedCarousel({super.key, required this.isPortrait, required this.items});

  @override
  Widget build(BuildContext context) {
    final cardHeight = isPortrait ? context.heightUnit * 22 : context.heightUnit * 40;
    final controller = PageController(viewportFraction: 0.86);

    return SizedBox(
      height: cardHeight,
      child: PageView.builder(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          final item = items[i];
          return Padding(
            padding: EdgeInsets.only(right: context.widthUnit * 3),
            child: Material(
              borderRadius: BorderRadius.circular(context.widthUnit * 4),
              clipBehavior: Clip.antiAlias,
              color: AppColors.primary,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => RecipeDetailView(recipe: item)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(item.image, fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.05), Colors.black.withOpacity(0.65)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(context.widthUnit * 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: context.heightUnit * 2.05,
                            ),
                          ),
                          SizedBox(height: context.heightUnit * 1.2),
                          Row(
                            children: [
                              _CreatorBadge(name: item.authorName, avatar: item.authorImage),
                              const Spacer(),
                              _TimePill(minutes: item.minutes),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CreatorBadge extends StatelessWidget {
  final String name;
  final String avatar;
  const _CreatorBadge({required this.name, required this.avatar});
  @override
  Widget build(BuildContext context) {
    final avatarSize = context.heightUnit * 2.8;
    return Row(
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: context.widthUnit * 0.3)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(avatar, fit: BoxFit.cover),
        ),
        SizedBox(width: context.widthUnit * 2),
        Text(name, style: TextStyle(color: Colors.white, fontSize: context.heightUnit * 1.6)),
      ],
    );
  }
}

class _TimePill extends StatelessWidget {
  final int minutes;
  const _TimePill({required this.minutes});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 0.8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(context.widthUnit * 2.5),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: context.widthUnit * 4.5,
            height: context.widthUnit * 4.5,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 1.2)),
          ),
          SizedBox(width: context.widthUnit * 2),
          Text('${minutes} ${AppStrings.min}', style: TextStyle(color: Colors.white, fontSize: context.heightUnit * 1.6)),
        ],
      ),
    );
  }
}
