 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/service_details_page.dart';

// Obsolete. Pills handled by TabPillSelector.
class CategoryItem extends StatelessWidget {
  final String label;
  final String assetPath;

  const CategoryItem({
    super.key,
    required this.label,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
 
