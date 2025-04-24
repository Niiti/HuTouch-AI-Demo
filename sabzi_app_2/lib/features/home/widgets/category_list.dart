import 'package:flutter/material.dart';
import 'package:my_project/features/home/widgets/category_tile.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scrollbar(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CategoryTile(
              imagePath: 'assets/images/pulses.png',
              title: 'Pulses',
            ),
            SizedBox(width: 8),
            CategoryTile(
              imagePath: 'assets/images/rice.png',
              title: 'Rice',
            ),
          ],
        ),
      ),
    );
  }
}