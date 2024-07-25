import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/upload_photo_view_model.dart';
import '../widgets/photo_card.dart';
import '../widgets/common_button.dart';
import 'package:flutter/services.dart'; // For asset image
import 'dart:io'; // For FileImage
import '../views/gender_selection_screen.dart>';
import 'package:image_picker/image_picker.dart';

class UploadPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UploadPhotoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload photos of yourself'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip action
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5 - 6 close-up portraits where only you are seen.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  // color: Colors.grey[200], // Placeholder color
                  child: Image.asset(
                  'assets/images/image1.png', // Path to static image placeholder
                  fit: BoxFit.cover,
                  ),
                ),
                ),
                // IconButton(
                // icon:
                //   Icon(Icons.add_a_photo, size: 40, color: Colors.white),
                // onPressed: () => viewModel.pickImage(ImageSource.camera),
                // ),
              ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => viewModel.pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: () => viewModel.pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Selected images',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Consumer<UploadPhotoViewModel>(
              builder: (context, viewModel, child) {
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: viewModel.photos
                      .map(
                        (photo) => PhotoCard(
                          image: photo.image,
                          onDelete: () => viewModel.removePhoto(photo.id),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            SizedBox(height: 8),
            Text(
              '${viewModel.photos.length}/6',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            CommonButton(
              text: 'Create',
                onPressed: () {
                // Handle create action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenderSelectionScreen()),
                );
                },
            ),
          ],
        ),
      ),
    );
  }
}
