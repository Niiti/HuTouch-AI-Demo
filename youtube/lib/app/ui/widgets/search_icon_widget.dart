import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class SearchIconWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SearchIconWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        size: 24.0,
        color: AppConstants.iconColor,
      ),
      onPressed: onTap,
    );
  }
}