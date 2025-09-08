import 'package:flutter/material.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class HeaderSectionPanel extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final String title;
  final String? subtitle;
  final Color textColor;
  final Widget? trailing;

  const HeaderSectionPanel({
    super.key,
    required this.height,
    required this.backgroundColor,
    required this.title,
    this.subtitle,
    this.textColor = const Color(0xFF354443),
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.heightUnit * 2.0);
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: radius),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.heightUnit * 2.6,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: context.heightUnit * 0.8),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: context.heightUnit * 2.0,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ],
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
