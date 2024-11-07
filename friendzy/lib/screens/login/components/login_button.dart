// lib/components/login_button.dart
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String? iconAsset;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  LoginButton({
    required this.text,
    this.icon,
    this.iconAsset,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: color.opacity == 1.0 ? 1.0 : 0.1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: iconAsset != null && iconAsset!.isNotEmpty
                  ? Center(
                      child: Image.asset(
                        iconAsset!,
                        width: 24,
                        height: 24,
                      ),
                    )
                  : icon != null
                      ? Icon(
                          icon,
                          color: color,
                        )
                      : SizedBox.shrink(),
            ),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Hellix',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: textColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
