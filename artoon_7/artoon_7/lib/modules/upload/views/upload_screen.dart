import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../gender_selection/view/gender_selection_screen.dart';
import '../view_models/upload_view_model.dart';

class UploadScreen extends StatelessWidget {
  final UploadViewModel viewModel = Get.put(UploadViewModel());

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;

    // Calculate button size based on screen size
    final double buttonSize =
        size.width * 0.25; // Adjust this percentage as needed

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft, // Align the title to the left
          child: Text(
            'Upload photos of yourself',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'proxima-nova', // Use a custom font (if available)
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Navigate to the previous page
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.blue, // Change the text color to blue
                fontWeight: FontWeight.bold, // Optionally make the Skip button text bold too
                fontFamily: 'Space Grotesk', // Use a custom font (if available)
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5-6 close-up portraits where only you are seen.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (viewModel.errorMessage.isNotEmpty) {
                return Text(
                  viewModel.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                );
              }
              return SizedBox.shrink();
            }),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/image1.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            // Expanded(child: PhotoGrid()), // Ensure grid takes up available space
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () => viewModel.pickAndUploadPhotos(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_library, color: Colors.black),
                        SizedBox(height: 8),
                        Text('Gallery', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () => viewModel.captureAndUploadPhoto(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined, color: Colors.black),
                        SizedBox(height: 8),
                        Text('Camera', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () => viewModel.captureAndUploadPhoto(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_search_sharp, color: Colors.black),
                        SizedBox(height: 8),
                        Text('DEMO', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromRGBO(0, 122, 255, 1), // White text color
                minimumSize: Size(double.infinity, 50), // Full-width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Border radius
                ),
              ),
              onPressed: () {
                // Call viewModel.createProfile() if needed before navigation
                viewModel.createProfile();

                // Navigate to the next screen
                Get.to(() => GenderSelectionScreen());
              },
              child: Text('Create'),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
