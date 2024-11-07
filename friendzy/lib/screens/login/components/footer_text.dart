// lib/components/footer_text.dart
import 'package:flutter/material.dart';
import '../constants.dart';

class FooterText extends StatelessWidget {
  final VoidCallback onTap;
  FooterText({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: footerTextStyle,
          children: [
            TextSpan(
              text: 'Sign Up',
              style: footerHighlightTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
