import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap; // Add onTap handler

  FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Add onTap here
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: selected ? Color.fromARGB(134, 199, 225, 247) : Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 4),
                    blurRadius: 8.0,
                  ),
                ]
              : [],
          border: Border.all(
              color: selected
                  ? Color.fromRGBO(0, 126, 254, 1)
                  : Colors.transparent),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: selected
                    ? Color.fromRGBO(0, 126, 254, 1)
                    : Color.fromRGBO(115, 118, 132, 1)),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: selected
                            ? Color.fromRGBO(0, 126, 254, 1)
                            : Color.fromRGBO(73, 76, 97, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                        color: Color.fromRGBO(120, 124, 152, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
