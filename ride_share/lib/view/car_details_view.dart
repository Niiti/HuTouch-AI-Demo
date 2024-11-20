import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/utils/app_colors.dart';
import 'package:ride_share/view/feature_card.dart';
import 'package:ride_share/view/specification_card.dart';

import '../controller/car_details_controller.dart';

class CarDetailsView extends StatelessWidget {
  final controller = Get.put(CarDetailsController());
  final String carName;

  CarDetailsView({required this.carName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Image.asset('assets/icons/Back.png', width: 24),
                    SizedBox(width: 4),
                    Text('Back', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      '$carName',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          '4.9 (531 reviews)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(() => Image.asset(
                        controller.carImages[controller.carImageIndex.value],
                        height: size.height * 0.25)),
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        onTap: controller.previousImage,
                        child: Image.asset('assets/icons/Left Arrow.png',
                            width: 24),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: controller.nextImage,
                        child: Image.asset('assets/icons/Right Arrow.png',
                            width: 24),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Specifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpecificationCard(
                    icon: 'assets/icons/Max Power.png',
                    title: 'Max. power',
                    value: '2500hp',
                  ),
                  SpecificationCard(
                    icon: 'assets/icons/Fual.png',
                    title: 'Fuel',
                    value: '10km per litre',
                  ),
                  SpecificationCard(
                    icon: 'assets/icons/Speed.png',
                    title: 'Max. speed',
                    value: '230kph',
                  ),
                  SpecificationCard(
                    icon: 'assets/icons/mph.png',
                    title: '0-60mph',
                    value: '2.5sec',
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Car features',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              FeatureCard(feature: 'Model', value: 'GT5000'),
              FeatureCard(feature: 'Capacity', value: '760hp'),
              FeatureCard(feature: 'Color', value: 'Red'),
              FeatureCard(feature: 'Fuel type', value: 'Octane'),
              FeatureCard(feature: 'Gear type', value: 'Automatic'),
              Divider(color: Colors.grey[300]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: controller.bookLater,
                      child: Text('Book later'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                        fixedSize: Size((size.width / 2) - 24, 54),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        side: BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: controller.rideNow,
                      child: Text('Ride Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        fixedSize: Size((size.width / 2) - 24, 54),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
