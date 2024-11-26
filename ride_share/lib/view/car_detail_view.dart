import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/controller/car_controller_detail.dart';

class CarDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dCarController = Get.put(DCarController());
    // Get.put(DCarController());

    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFDDDDDD)),
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFE2F5ED),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dCarController.selectedCar.value.name,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFC107)),
                        Text(
                            '${dCarController.selectedCar.value.rating} (${dCarController.selectedCar.value.reviews} reviews)'),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(dCarController.selectedCar.value.imagePath,
                  width: 100, height: 60),
            ],
          ),
        ));
  }
}
