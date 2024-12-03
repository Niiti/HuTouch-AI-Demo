import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';
import '../../controllers/search_controller.dart' as sc;

class SearchBar extends StatelessWidget {
      final sc.SearchController searchController = Get.find<sc.SearchController>();

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.04);
    return Padding(
      padding: EdgeInsets.all(width),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSettings.borderRadius),
          border: Border.all(
            color: Color(0xFFE3E3E3),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Image.asset(AppSettings.searchIcon,
                  width: ResponsiveHelper.getWidth(context, 0.06)),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                onChanged: searchController.updateSearchQuery,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
