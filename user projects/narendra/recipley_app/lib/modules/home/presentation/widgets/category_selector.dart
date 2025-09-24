import 'package:flutter/material.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/shared/widgets/category_pill_button.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class CategorySelector extends StatelessWidget {
  final List<Category> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final chipHeight = context.heightUnit * 4.6;
    return SizedBox(
      height: chipHeight,
      child: Scrollbar(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) => SizedBox(width: context.widthUnit * 3),
          itemBuilder: (_, i) {
            final cat = categories[i];
            final selected = selectedIndex == i;
            return CategoryPillButton(
              label: cat.name,
              selected: selected,
              onTap: () => onSelect(i),
            );
          },
        ),
      ),
    );
  }
}
