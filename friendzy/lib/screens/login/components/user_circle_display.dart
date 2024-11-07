// lib/components/user_circle_display.dart
import 'package:flutter/material.dart';
import '../constants.dart';

class UserCircleDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Circle Border
          Container(
            width: 290.44,
            height: 284.37,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: secondaryColor.withOpacity(0.16),
                width: 1.0,
              ),
            ),
          ),
          // Middle Circle with Background Color
          Container(
            width: 203.19,
            height: 198.94,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor.withOpacity(0.15),
            ),
          ),
          // Central White Circle
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          // Central User Image with Border and Shadow
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: secondaryColor,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(41, 41, 42, 0.07),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/User_avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Surrounding Small Circles with User Images
          Positioned(
            left: 70,
            top: 10,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/Vanessa.png'),
            ),
          ),
          Positioned(
            left: -70,
            top: 10,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/Selena.png'),
            ),
          ),
          Positioned(
            left: 90,
            bottom: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/james.png'),
            ),
          ),
          Positioned(
            left: -90,
            bottom: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/eddie.png'),
            ),
          ),
          // Location Pin Icon
          Positioned(
            right: 0,
            top: 50,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(41, 41, 42, 0.07),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/Location_pin.png',
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ),
          // Chat Bubble Icon
          Positioned(
            left: 0,
            bottom: 50,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(41, 41, 42, 0.07),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/Notifications.png',
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
