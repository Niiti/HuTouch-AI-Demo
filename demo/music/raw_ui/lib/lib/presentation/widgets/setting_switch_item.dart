import 'package:flutter/material.dart';

class SettingSwitchItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  SettingSwitchItem({
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
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
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white.withOpacity(0.75),
          inactiveTrackColor: Colors.white.withOpacity(0.12),
        ),
      ),
    );
  }
}