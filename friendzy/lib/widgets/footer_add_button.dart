// lib/widgets/footer_add_button.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class FooterAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  FooterAddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 48,
      child: Center(
        child: FloatingActionButton(
          backgroundColor: kWhiteColor,
          elevation: 0,
          onPressed: onPressed,
          child: Image.asset(
            'assets/add_icon.png',
            width: 24,
            height: 24,
            color: kAccentColor,
          ),
        ),
      ),
    );
  }
}
