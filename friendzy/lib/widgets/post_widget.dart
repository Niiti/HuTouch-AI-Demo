import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/post.dart';
import 'action_icon.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onMorePressed;

  PostWidget({
    required this.post,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 343,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          // Post Background
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              post.imagePath,
              width: double.infinity,
              height: 343,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Container(
            width: double.infinity,
            height: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  kPrimaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Category Tag
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    post.categoryIcon,
                    width: 16,
                    height: 16,
                    color: kWhiteColor,
                  ),
                  SizedBox(width: 4),
                  Text(
                    post.categoryText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Hellix',
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Like and Comment Icons
          Positioned(
            right: 16,
            top: 100,
            child: Column(
              children: [
                GestureDetector(
                  onTap: onLikePressed,
                  child: ActionIcon(
                    iconPath: 'assets/like.png',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: onCommentPressed,
                  child: ActionIcon(
                    iconPath: 'assets/comments_white_icon.png',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: onMorePressed,
                  child: ActionIcon(
                    iconPath: 'assets/three dots.png',
                  ),
                ),
              ],
            ),
          ),
          // Post Text
          Positioned(
            left: 16,
            bottom: 80,
            right: 80,
            child: Text(
              post.postText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Hellix',
                height: 24 / 20,
              ),
            ),
          ),
          // User Info
          Positioned(
            left: 16,
            bottom: 16,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(post.userImage),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Hellix',
                        height: 19.6 / 14,
                      ),
                    ),
                    Text(
                      post.userLocation.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Hellix',
                        letterSpacing: 2,
                        height: 14 / 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
