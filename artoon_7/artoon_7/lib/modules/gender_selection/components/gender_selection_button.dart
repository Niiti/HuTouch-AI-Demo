import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isSelected; // Indicates if the button is selected

  GenderSelectionButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isSelected = false, // Default to not selected
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width for dynamic sizing
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the image size as a percentage of the screen width
    double imageSize = screenWidth * 0.15; // Adjust this percentage as needed

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: isSelected ? Color.fromARGB(255, 240, 240, 240) : Colors.white, // Dynamic background color
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Color.fromARGB(255, 164, 164, 164), // Dynamic border color
            width: isSelected ? 2 : 1, // Slightly thicker border if selected
          ),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              icon,
              width: imageSize,
              height: imageSize,
              color: isSelected ? Colors.blue : null, // Tint image if selected
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 13, color: Color(0xFF494C61))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}