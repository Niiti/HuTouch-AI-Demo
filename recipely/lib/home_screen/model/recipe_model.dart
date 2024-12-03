// TODO Implement this library.

import 'package:flutter/material.dart';

class RecipeModel {
  final String imageUrl;
  final String title;
  final String author;
  final String time;

  RecipeModel({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      imageUrl: json['imageUrl'],
      title: json['title'],
      author: json['author'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'author': author,
      'time': time,
    };
  }
}
