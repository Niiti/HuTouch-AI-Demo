// lib/screens/login_screen.dart
import 'package:dating3/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/user_circle_display.dart';
import '../components/login_button.dart';
import '../components/footer_text.dart';
import 'phone_login_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(color: Colors.white),
          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120),
                // User Circle Display
                UserCircleDisplay(),
                SizedBox(height: 80),
                // Main Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    'Let’s meeting new people around you',
                    style: headingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 60),
                // Login with Phone Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: LoginButton(
                    text: 'Login with Phone',
                    icon: Icons.phone,
                    color: primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    iconAsset: 'assets/phone.png',
                  ),
                ),
                SizedBox(height: 16),
                // Login with Google Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: LoginButton(
                    text: 'Login with Google',
                    iconAsset: 'assets/google.png',
                    color: secondaryColor,
                    textColor: primaryColor,
                    onPressed: () {
                      // Implement Google Sign-In
                    },
                    icon: Icons.search,
                  ),
                ),
                SizedBox(height: 40),
                // Footer Text
                FooterText(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
                SizedBox(height: 36),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
