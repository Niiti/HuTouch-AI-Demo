import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';
import '../../../utils/utils.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();

  final Color redColor = Color.fromRGBO(255, 79, 79, 1);
  final Color blackColor = Color.fromRGBO(21, 0, 0, 1);
  final Color whiteColor = Colors.white;
  final Color lightGrayColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImagesAsset.appLogo,
                          width: width * 0.06,
                          height: width * 0.06,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          AppConstants.appTitle.toUpperCase(),
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt,
                            color: blackColor, size: width * 0.05),
                        SizedBox(width: width * 0.02),
                        Icon(Icons.wifi, color: blackColor, size: width * 0.05),
                        SizedBox(width: width * 0.02),
                        Icon(Icons.battery_full,
                            color: blackColor, size: width * 0.05),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      ImagesAsset.womanAthleteImage,
                      width: width * 0.9,
                      height: height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Column(
                children: [
                  Text(
                    AppString.keepAnEyeOnTheStadium,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: width * 0.08,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      AppString.watchSportsDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: width * 0.04,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Column(
                children: [
                  // Login Button with Triangular Edges
                  SizedBox(
                    width: width * 0.8,
                    child: ClipPath(
                      clipper: TriangularClipper(),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppConstants.loginRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0), // Shape managed by ClipPath
                          ),
                        ),
                        child: Text(
                          AppString.login,
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: width * 0.05,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Create Account Button with Triangular Edges
                  SizedBox(
                    width: width * 0.8,
                    child: ClipPath(
                      clipper: TriangularClipper(),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppConstants.createAccountRoute);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: lightGrayColor,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0), // Shape managed by ClipPath
                          ),
                        ),
                        child: Text(
                          AppString.createAccount,
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: width * 0.05,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class TriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(20, 0); // Left triangle start
    path.lineTo(0, size.height / 2); // Left triangle point
    path.lineTo(20, size.height); // Left triangle end
    path.lineTo(size.width - 20, size.height); // Bottom-right corner
    path.lineTo(size.width, size.height / 2); // Right triangle point
    path.lineTo(size.width - 20, 0); // Right triangle end
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
