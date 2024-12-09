import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';

class PlayerCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String info;
  final double width;

  const PlayerCard({
    required this.imageUrl,
    required this.name,
    required this.info,
    required this.width,
  });

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  bool isFollowing = false;

  void toggleFollowState() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.width * 0.04,
        vertical: widget.width * 0.02,
      ),
      padding: EdgeInsets.all(widget.width * 0.04),
      color: AppColors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: widget.width * 0.06,
            backgroundImage: AssetImage(widget.imageUrl),
          ),
          SizedBox(width: widget.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: widget.width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.info,
                  style: TextStyle(
                    fontSize: widget.width * 0.03,
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: toggleFollowState,
            child: ClipPath(
              clipper: HexagonClipper(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.width * 0.04,
                  vertical: widget.width * 0.02,
                ),
                color: AppColors.darkText,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isFollowing)
                        Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: widget.width * 0.035,
                        ),
                      if (isFollowing) SizedBox(width: widget.width * 0.02),
                      Text(
                        isFollowing
                            ? AppString.following
                            : AppString.followButton,
                        style: TextStyle(
                          fontSize: widget.width * 0.035,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bebas Neue',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
