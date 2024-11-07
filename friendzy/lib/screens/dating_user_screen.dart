// File: lib/screens/dating_user_screen.dart

import 'package:dating3/models/match_card_data.dart';
import 'package:dating3/widgets/circular_button.dart';
import 'package:dating3/widgets/interest_badge.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class DatingUserScreen extends StatelessWidget {
  final MatchCardData data;

  DatingUserScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          // Image Section
          Positioned.fill(
            child: Image.asset(
              '${data.imageAsset}',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor.withOpacity(0),
                    AppColors.primaryColor.withOpacity(0.5),
                    AppColors.primaryColor.withOpacity(0.95),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.557667, 1],
                ),
              ),
            ),
          ),
          // Header Section
          // Back Button
          Positioned(
            top: 44,
            left: 24,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.textColor.withOpacity(0.5),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          // Distance Display
          Positioned(
            top: 44,
            right: 24,
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
                backgroundBlendMode: BlendMode.overlay,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/location.png',
                    width: 16,
                    height: 16,
                    color: AppColors.textColor,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${data.distance}',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: 'Hellix',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Name and Location
          Positioned(
            top: MediaQuery.of(context).size.height * 0.465,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${data.name}, ${data.age}',
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  '${data.location}',
                  style: AppTextStyles.subhead,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Match Percentage
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            left: MediaQuery.of(context).size.width / 2 - 67.5,
            child: GestureDetector(
              onTap: () {
                // Match button action
              },
              child: Container(
                width: 135,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: AppColors.accentColor,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              AppColors.accentColor.withOpacity(0.3),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.accentColor,
                        ),
                        Text(
                          '${data.matchPercentValue}%',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: 'Hellix',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.3333,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Match',
                      style: AppTextStyles.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // About and Interest Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 341,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About
                      Text(
                        'About',
                        style: AppTextStyles.bodyTextGrey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${data.about}',
                        style: AppTextStyles.bodyText,
                      ),
                      SizedBox(height: 24),
                      // Interest
                      Text(
                        'Interest',
                        style: AppTextStyles.bodyTextGrey,
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          InterestBadge(
                            text: '🌿 Nature',
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                          InterestBadge(
                            text: '✈️ Travel',
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                          InterestBadge(
                            text: '👥 People',
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                          InterestBadge(
                            text: '💪 Gym & Fitness',
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                          InterestBadge(
                            text: '✍️ Writing',
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Footer Buttons
          Positioned(
            bottom: 70,
            left: MediaQuery.of(context).size.width / 2 - 124,
            child: Container(
              width: 248,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    blurRadius: 40,
                    offset: Offset(8, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularButton(
                      icon: Icons.close,
                      color: Colors.white,
                      iconColor: AppColors.primaryColor.withOpacity(0.5),
                      shadowColor: AppColors.primaryColor.withOpacity(0.2),
                      onPressed: () {
                        // Dislike action
                      },
                    ),
                    CircularButton(
                      icon: Icons.star,
                      color: AppColors.primaryColor,
                      iconColor: AppColors.textColor,
                      shadowColor: AppColors.primaryColor.withOpacity(0.2),
                      onPressed: () {
                        // Super Like action
                      },
                    ),
                    CircularButton(
                      icon: Icons.favorite,
                      color: AppColors.accentColor,
                      iconColor: AppColors.textColor,
                      shadowColor: AppColors.primaryColor.withOpacity(0.2),
                      onPressed: () {
                        // Like action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Home Indicator
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 67,
            child: Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.greyTextColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
