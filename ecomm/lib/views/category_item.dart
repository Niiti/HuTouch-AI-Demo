import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../constants/app_constants.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(category.image),
            radius: 28.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          category.label,
          style: TextStyle(
            fontSize: 10.0,
            fontFamily: 'Montserrat',
            color: Color(0xFF21003D),
          ),
        ),
      ],
    );
  }
}
