import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String imageAsset;
  final Color backgroundColor;
  final Color borderColor;

  CategoryModel({
    required this.title,
    required this.imageAsset,
    required this.backgroundColor,
    required this.borderColor,
  });
}