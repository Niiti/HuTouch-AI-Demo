import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/modules/profiles/presentation/widgets/back_arrow_screen_title.dart';
import 'package:my_project/modules/profiles/presentation/widgets/manage_profiles.dart';
import 'package:my_project/modules/profiles/presentation/widgets/option_tile.dart';
import 'package:my_project/modules/profiles/presentation/widgets/profile_selection.dart';
import 'package:my_project/utils/error_handler.dart';
import 'package:my_project/core/constants/images_asset.dart';

class ProfilesAndMoreScreen extends StatelessWidget {
  const ProfilesAndMoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              BackArrowScreenTitle(title: AppStrings.profilesAndMore),
              SizedBox(height: screenHeight * 0.03),
              ProfileSelection(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.03),
              ManageProfiles(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: Scrollbar(
                  child: ListView(
                    children: [
                      OptionTile(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        iconAsset: ImagesAsset.notification,
                        title: AppStrings.notifications,
                        onTap: () {},
                      ),
                      OptionTile(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        iconAsset: ImagesAsset.myList,
                        title: AppStrings.myList,
                        onTap: () {},
                      ),
                      OptionTile(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        iconAsset: ImagesAsset.settings,
                        title: AppStrings.appSettings,
                        onTap: () {},
                      ),
                      OptionTile(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        iconAsset: ImagesAsset.accounts,
                        title: AppStrings.account,
                        onTap: () {},
                      ),
                      OptionTile(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        iconAsset: ImagesAsset.help,
                        title: AppStrings.help,
                        onTap: () {
                          ErrorHandler.showErrorMessage(
                            // context: context,
                            message: 'Help option not implemented.',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.signOut,
                      style: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
