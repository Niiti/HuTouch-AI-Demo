import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class HexagonButton extends StatefulWidget {
  
  const HexagonButton({super.key});

  @override
  State<HexagonButton> createState() => _HexagonButtonState();
}

class _HexagonButtonState extends State<HexagonButton> {
  bool isFollowing = false;

  void toggleFollowState() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: toggleFollowState,
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: width * 0.02,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isFollowing)
                  Icon(
                    Icons.check, // Tick mark icon
                    color: AppColors.white,
                    size: 16,
                  ),
                if (isFollowing)
                  const SizedBox(width: 4), // Space between tick and text
                Text(
                  isFollowing ? AppString.following : AppString.follow,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Bebas Neue',
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;

    final Path path = Path();
    path.moveTo(0, height / 2); // Start from the left middle
    path.lineTo(width * 0.1, 0); // Top-left triangle edge
    path.lineTo(width * 0.9, 0); // Top-right triangle edge
    path.lineTo(width, height / 2); // Middle-right point
    path.lineTo(width * 0.9, height); // Bottom-right triangle edge
    path.lineTo(width * 0.1, height); // Bottom-left triangle edge
    path.close(); // Close the path to form the shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip unless the size changes
  }
}
