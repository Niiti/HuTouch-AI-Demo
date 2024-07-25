import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/custom_button.dart';
import '../components/image_card.dart';
import '../controllers/image_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'gender_selection_screen.dart';

class CreateUploadedPhotoScreen extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.uploadPhotosTitle),
        actions: [
          TextButton(
            onPressed: () {
              // Skip action
            },
            child: Text(AppStrings.skipButton,
                style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.uploadPhotosTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.uploadPhotosSubtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(0, 158, 158, 158),
              child: Image.asset(
                'assets/images/image1.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => imageController.pickImageFromGallery(),
                    child: Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            size: 50,
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AppStrings.galleryButton,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => imageController.pickImageFromCamera(),
                    child: Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AppStrings.cameraButton,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(AppStrings.selectedImagesTitle),
            Obx(
              () => Wrap(
                children: imageController.selectedImages
                    .map((image) => ImageCard(
                          image: AssetImage(image.path),
                          isSelected: true,
                          onClose: () {
                            imageController.removeImage(image);
                          },
                        ))
                    .toList(),
              ),
            ),
            Spacer(),
            CustomButton(
              text: AppStrings.createButton,
              color: AppColors.primary,
              textColor: Colors.white,
              onPressed: () {
                // Create action
                Get.to(() => GenderSelectionScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
