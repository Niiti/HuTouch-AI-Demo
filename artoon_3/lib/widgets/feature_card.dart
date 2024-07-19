import 'package:flutter/material.dart';
import '../models/feature_model.dart';
import '../resources/colors.dart';

class FeatureCard extends StatelessWidget {
  final Feature feature;
  final VoidCallback onTap;

  FeatureCard({required this.feature, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: feature.isSelected
              ? AppColors.selectedBorder
              : AppColors.unselectedBorder,
          width: 2,
        ),
      ),
      color: feature.isSelected ? AppColors.selectedBackground : Colors.white,
      child: ListTile(
        leading: Image.asset(
          feature.icon,
          width: 30,
          height: 30,
        ),
        title: Text(
          feature.title,
          style: TextStyle(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(feature.description),
        onTap: onTap,
      ),
      elevation: 4,
    );
  }
}
