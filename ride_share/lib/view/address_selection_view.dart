import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/address_selection_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

Widget addressSelectionView(BuildContext context) {
  final AddressSelectionController controller =
      Get.put(AddressSelectionController());

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: EdgeInsets.all(AppConstants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
              SizedBox(height: 24),
              _buildTextField('From', 'assets/icons/Settings.png'),
              SizedBox(height: 16),
              _buildTextField('To', 'assets/icons/map.png'),
              SizedBox(height: 24),
              Text(
                'Recent places',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    controller: scrollController,
                    itemCount: controller.places.length,
                    itemBuilder: (context, index) {
                      final place = controller.places[index];
                      return _buildPlaceEntry(
                          place.name, place.address, place.distance);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildTextField(String label, String iconPath) {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray),
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            iconPath,
            width: AppConstants.iconSize,
            height: AppConstants.iconSize,
            color: AppColors.iconColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: AppColors.black),
        ),
      ],
    ),
  );
}

Widget _buildPlaceEntry(String name, String address, String distance) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Image.asset('assets/icons/map.png',
            width: AppConstants.iconSize,
            height: AppConstants.iconSize,
            color: AppColors.iconColor),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(color: AppColors.gray),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Text(
          distance,
          style: TextStyle(color: AppColors.gray),
        ),
      ],
    ),
  );
}
