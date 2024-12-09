import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';
import '../../../utils/responsive_helper.dart';
import '../../../utils/error_handler.dart';

class SportHeader extends StatelessWidget {
  final double fontSizeScale;

  SportHeader({required this.fontSizeScale});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                ImagesAsset.appLogoWhite,
                width: size.width * 0.08,
                height: size.width * 0.08,
                color: AppColors.white,
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                AppString.appName,
                style: TextStyle(
                  fontFamily: 'Azeret Mono',
                  fontSize: 20 * fontSizeScale,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * 0.04),
          Text(
            AppString.welcomeTitle,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 24 * fontSizeScale,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: size.width * 0.02),
          Text(
            AppString.welcomeDescription,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 12 * fontSizeScale,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: size.width * 0.04),
          Center(
            child: SizedBox(
              width: size.width * 0.5,
              child: ClipPath(
                clipper: TriangularClipper(),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.black),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to sign in
                  },
                  child: Text(
                    AppString.signInJoin,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 16 * fontSizeScale,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
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

class TriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(20, 0);
    path.lineTo(0, size.height / 2);
    path.lineTo(20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
