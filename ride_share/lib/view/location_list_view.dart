import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/location_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import 'components/location_card.dart';

class LocationListView extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // TODO: Add functionality for opening menu settings
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(AppConstants.menuIcon, width: 24),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.locations.length,
          itemBuilder: (context, index) {
            return LocationCard(location: controller.locations[index]);
          },
        ),
      ),
    );
  }
}
