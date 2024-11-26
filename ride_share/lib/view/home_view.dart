import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share/controller/transport_controller.dart';
import 'package:ride_share/utils/app_constants.dart';
import 'package:ride_share/utils/color_theme.dart';
import 'package:ride_share/view/transport_option_widget.dart';

class HomeView extends StatelessWidget {
  static bool isNavigatingBack =
      false; // Static flag to debounce back navigation

  @override
  Widget build(BuildContext context) {
    final TransportController controller = Get.find();

    return Scaffold(
      backgroundColor: ColorTheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorTheme.background,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (!isNavigatingBack) {
                  isNavigatingBack = true; // Set flag to true
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 500), () {
                    isNavigatingBack = false; // Reset flag after delay
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppConstants.backIconPath,
                        width: 20, height: 20),
                  ),
                  Text('Back', style: TextStyle(color: ColorTheme.text)),
                ],
              ),
            ),
            Spacer(),
            Text(
              'Select transport',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorTheme.text,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Select your transport',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorTheme.text,
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Obx(
                () => GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: controller.transportOptions
                      .map(
                        (option) => TransportOptionWidget(
                          title: option.title,
                          imagePath: option.iconPath,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
