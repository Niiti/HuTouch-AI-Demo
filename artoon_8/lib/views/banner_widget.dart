// lib/views/widgets/banner_widget.dart
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Image.asset(
        'assets/images/banner.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
