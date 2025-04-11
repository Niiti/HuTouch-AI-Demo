import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/modules/splash/presentation/widgets/app_logo.dart';
import 'package:my_project/modules/splash/presentation/widgets/screen_title.dart';
import 'package:my_project/modules/splash/presentation/widgets/profile_selection_card.dart';
import 'package:my_project/core/constants/images_asset.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05,
          horizontal: screenWidth * 0.1,
        ),
        child: Column(
          children: [
            const AppLogo(),
            SizedBox(height: screenHeight * 0.05),
            const ScreenTitle(title: AppStrings.splashScreenTitle),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.04,
                mainAxisSpacing: screenHeight * 0.04,
                children: const [
                  ProfileSelectionCard(
                    imageAsset: ImagesAsset.profile1,
                    userName: 'John',
                  ),
                  ProfileSelectionCard(
                    imageAsset: ImagesAsset.profile2,
                    userName: 'Mike',
                  ),
                  ProfileSelectionCard(
                    imageAsset: ImagesAsset.profile3,
                    userName: 'Helina',
                  ),
                  ProfileSelectionCard(
                    imageAsset: ImagesAsset.profile4,
                    userName: 'Kids',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
