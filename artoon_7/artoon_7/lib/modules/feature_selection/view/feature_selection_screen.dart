import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../upload/views/upload_screen.dart';
import '../view_model/feature_selection_view_model.dart';
import 'feature_card.dart';

/// Screen for selecting the desired features.
class FeatureSelectionScreen extends StatelessWidget {
  final FeatureSelectionViewModel controller =
      Get.put(FeatureSelectionViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Which features do you like the most?',style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.features.length,
                  itemBuilder: (context, index) {
                    final feature = controller.features[index];
                    return FeatureCard(
                      title: feature.title,
                      description: feature.description,
                      icon: feature.icon,
                      selected:
                          controller.selectedFeature.value == feature.title,
                    );
                  },
                ),
              ),
            ),

            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  if (controller.selectedFeature.isEmpty) {
                    Get.snackbar(
                        'Error', 'Please select a feature to proceed.');
                  } else {
                    // Handle the next button press
                    Get.to(() => UploadScreen(),
                        arguments: controller.selectedFeature.value);
                  }
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 122, 255, 1), // Button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(double.infinity, 54),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF787C98),
                    ),
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

/// Screen to navigate after feature selection
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String selectedFeature = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Selected Feature: $selectedFeature'),
      ),
    );
  }
}
