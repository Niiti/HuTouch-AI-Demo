import 'package:flutter/material.dart';

import '../screens/profile_page.dart';
import 'app_constants.dart';

class HeaderSection extends StatelessWidget {
void _onProfileTapped(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
  );
}

  void _onNotificationTapped() {
    // Navigate to profile page
    ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.fromLTRB(AppConstants.mediumSpacing, AppConstants.extraLargeSpacing, AppConstants.mediumSpacing, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '👋 Hi Logan,',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.75),
                  height: 1.25,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Good Evening',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.75),
                  height: 1.2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _onNotificationTapped,
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications_none,
                      color: Colors.white.withOpacity(0.75),
                      size: 32,
                    ),
                    Positioned(
                      right: 0,
                      top: 4,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppConstants.mediumSpacing),
              GestureDetector(
                onTap: () => _onProfileTapped(context),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(AppConstants.profileImageUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}