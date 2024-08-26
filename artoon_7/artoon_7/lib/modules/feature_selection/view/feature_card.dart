import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/feature_selection_view_model.dart';

/// Reusable widget for displaying a feature card.
class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool selected;

  FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final FeatureSelectionViewModel controller = Get.find();

    return GestureDetector(
      onTap: () => controller.selectFeature(title),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: selected ? const Color.fromARGB(255, 213, 236, 255) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: selected
              ? Border.all(color: Colors.blue, width: 2)
              : Border.all(color: const Color.fromARGB(62, 0, 0, 0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(  // Ensures the column takes up available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF494C61)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF787C98)),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),  // Optional: Adds some spacing between the text and image
            Image.asset(
              icon,
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}