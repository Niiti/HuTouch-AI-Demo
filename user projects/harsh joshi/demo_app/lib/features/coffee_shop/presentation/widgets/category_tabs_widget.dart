// lib/features/coffee_shop/presentation/widgets/category_tabs_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';
import '../bloc/coffee_bloc.dart';

class CategoryTabsWidget extends StatelessWidget {
  const CategoryTabsWidget({Key? key}) : super(key: key);

  Widget _categoryTab(BuildContext context, String text, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isActive ? ColorPalette.brown : Colors.transparent,
          foregroundColor:
              isActive ? ColorPalette.white : ColorPalette.white.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => context.read<CoffeeBloc>().add(SelectCategory(text)),
        child: Text(
          text,
          style: ThemeConstants.categoryText.copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const categories = AppConstants.coffeeCategories;

    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        final coffeeBloc = context.read<CoffeeBloc>();
        final currentCategory = coffeeBloc.selectedCategory;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: categories
                .map((cat) => _categoryTab(context, cat, cat == currentCategory))
                .toList(),
          ),
        );
      },
    );
  }
}
