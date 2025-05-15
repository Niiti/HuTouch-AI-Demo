import 'package:flutter/material.dart';
import 'package:nectorfigma/features/explore_screen/models/category_model.dart';
import 'package:nectorfigma/features/explore_screen/widgets/product_card.dart';

class ProductCardsGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  const ProductCardsGrid({super.key, required this.categories});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return ProductCard(
          title: category.title,
          imageAsset: category.imageAsset,
          backgroundColor: category.backgroundColor,
          borderColor: category.borderColor,
        );
      },
    );
  }
}
