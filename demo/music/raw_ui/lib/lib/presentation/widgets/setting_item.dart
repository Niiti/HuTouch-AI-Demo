import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String value;
  final bool hasNavigation;
  final bool hasSubtitle;
  final String? subtitle;
  final VoidCallback? onTap;

  SettingItem({
    required this.title,
    required this.value,
    this.hasNavigation = false,
    this.hasSubtitle = false,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hasSubtitle ? 70 : 56,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.12), width: 0.5),
        ),
        color: Colors.black.withOpacity(0.12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.75),
          ),
        ),
        subtitle: hasSubtitle
            ? Text(
                subtitle ?? '',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            : null,
        trailing: hasNavigation
            ? Icon(
                Icons.navigate_next,
                color: Colors.white.withOpacity(0.75),
              )
            : Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1),
                ),
              ),
        onTap: onTap,
      ),
    );
  }
}