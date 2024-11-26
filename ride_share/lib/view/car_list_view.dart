import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/controller/car_controller.dart';
import 'package:ride_share/view/car_details_view.dart';
import '../utils/styles.dart';
import 'car_card.dart';

class CarListView extends StatelessWidget {
  final CarController carController = Get.put(CarController());
  static bool isNavigating = false; // Global flag for debouncing navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (!isNavigating) {
                    isNavigating = true; // Lock navigation
                    Get.back(); // Perform navigation
                    Future.delayed(const Duration(milliseconds: 500), () {
                      isNavigating = false; // Unlock navigation
                    });
                  }
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset('assets/icons/Back.png',
                          width: 24, height: 24),
                    ),
                    SizedBox(width: 4),
                    Text('Back', style: AppStyles.subtitleStyle),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Available cars for ride',
                    style: AppStyles.titleStyle),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('18 cars found', style: AppStyles.subtitleStyle),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: carController.cars.length,
                    itemBuilder: (context, index) {
                      final car = carController.cars[index];
                      return CarCard(
                        key: Key(car.name),
                        car: car,
                        onTap: () {
                          if (!isNavigating) {
                            isNavigating = true; // Lock navigation
                            Get.to(() => CarDetailsView(
                                carName: car.name)); // Perform navigation
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              isNavigating = false; // Unlock navigation
                            });
                          }
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
