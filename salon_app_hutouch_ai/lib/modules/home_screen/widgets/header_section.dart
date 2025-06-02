import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/custom_search_delegate.dart';
import 'package:get/get.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.04;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Added Expanded widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.helloUser,
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.manrope,
                    color: const Color.fromRGBO(17, 17, 17, 1),
                  ),
                  overflow: TextOverflow.ellipsis, // Added overflow handling
                ),
                SizedBox(height: height * 0.005),
                Text(
                  AppStrings.findServiceSubtitle,
                  style: TextStyle(
                    fontSize: height * 0.02,
                    fontFamily: Fonts.nunitoSans,
                    color: const Color.fromRGBO(80, 85, 92, 1),
                  ),
                  overflow: TextOverflow.ellipsis, // Added overflow handling
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: CircleAvatar(
              radius: height * 0.03,
              backgroundColor: const Color.fromRGBO(21, 103, 120, 1),
              child: Image.asset(
                ImagesAsset.searchIcon,
                color: Colors.white,
                width: height * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}