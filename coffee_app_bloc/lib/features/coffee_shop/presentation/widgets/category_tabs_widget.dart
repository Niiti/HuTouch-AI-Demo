import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../coffee_shop/domain/blocs/coffee_bloc.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../../../core/constants/color_palette.dart';

class CategoryTabsWidget extends StatelessWidget {
  const CategoryTabsWidget({Key? key}) : super(key: key);

  Widget categoryTab(BuildContext context, String text, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isActive ? ColorPalette.brown : Colors.transparent,
          foregroundColor: isActive
              ? ColorPalette.white
              : ColorPalette.white.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          context.read<CoffeeBloc>().add(SelectCategory(text));
        },
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
    final categories = ['All Coffee', 'Machiatto', 'Latte', 'Americano'];

    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        final coffeeBloc = context.read<CoffeeBloc>();
        final currentCategory = coffeeBloc.selectedCategory; // Use the getter

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: categories.map((cat) {
                return categoryTab(context, cat, cat == currentCategory);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
