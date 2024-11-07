import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/user.dart';
import '../screens/profile_screen.dart';

class AvatarWidget extends StatelessWidget {
  final User user;

  AvatarWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to profile or start a new chat
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(userName: user.name),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        width: AppConstants.avatarSize,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: AppConstants.avatarSize,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                        BorderRadius.circular(AppConstants.avatarRadius),
                    image: DecorationImage(
                      image: AssetImage(user.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.purpleColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              user.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.primaryFont,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
