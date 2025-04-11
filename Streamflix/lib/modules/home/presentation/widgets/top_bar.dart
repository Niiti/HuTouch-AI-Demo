// Updated code by Hutouch
/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:my_project/modules/profiles/presentation/screens/profiles_and_more_screen.dart';
import 'package:my_project/modules/splash/presentation/widgets/app_logo.dart';
import 'package:my_project/modules/splash/presentation/widgets/user_avatar.dart';
import 'package:my_project/core/constants/images_asset.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImagesAsset.sLogo,
            height: height * 0.06, // Made height dynamic
            width: width * 0.1, // Made width dynamic
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              IconButton(
                icon: Image.asset(
                  ImagesAsset.search,
                  width: width * 0.08,
                  height: height * 0.05,
                  fit: BoxFit.cover,
                ),
                onPressed: () {},
              ),
              SizedBox(width: width * 0.03),
              IconButton(
                icon: ClipOval(
                  // Wrapped profile image in circle
                  child: Image.asset(
                    ImagesAsset.profile1,
                    width: width * 0.06, // Decreased size of profile image
                    height: width * 0.06,
                    fit: BoxFit.cover,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilesAndMoreScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* SELECTED CODE END */
