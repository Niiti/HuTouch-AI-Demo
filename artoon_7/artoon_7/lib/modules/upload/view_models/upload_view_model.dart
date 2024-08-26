import 'dart:async';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/photo_model.dart';

/// UploadViewModel handles the business logic for uploading photos.
class UploadViewModel extends GetxController {
  final photos = <PhotoModel>[].obs;
  final errorMessage = ''.obs;

  final ImagePicker _picker = ImagePicker();

  /// Pick and upload photos from the gallery.
  Future<void> pickAndUploadPhotos() async {
    try {
      final List<XFile>? selectedPhotos = await _picker.pickMultiImage();

      if (selectedPhotos != null && selectedPhotos.isNotEmpty) {
        photos.value = selectedPhotos.map((photo) => PhotoModel(filePath: photo.path)).toList();
        await Future.delayed(Duration(seconds: 2)); // Simulate upload delay
        print('Photos uploaded successfully');
      }
    } catch (e) {
      errorMessage.value = 'Error picking photos: $e';
    }
  }

  /// Capture and upload a photo using the camera.
  Future<void> captureAndUploadPhoto() async {
    try {
      final XFile? capturedPhoto = await _picker.pickImage(source: ImageSource.camera);

      if (capturedPhoto != null) {
        photos.add(PhotoModel(filePath: capturedPhoto.path));
        await Future.delayed(Duration(seconds: 2)); // Simulate upload delay
        print('Photo captured and uploaded successfully');
      }
    } catch (e) {
      errorMessage.value = 'Error capturing photo: $e';
    }
  }

  /// Simulate creating a profile with the uploaded photos.
  Future<void> createProfile() async {
    if (photos.length < 5) {
      errorMessage.value = 'A minimum of 5 photos is required';
      return;
    }
    await Future.delayed(Duration(seconds: 2));
    print('Profile created successfully');
  }

  /// Simulate deleting a photo.
  Future<void> deletePhoto(String filename) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      photos.removeWhere((photo) => photo.filePath.endsWith(filename));
      print('Photo deleted successfully');
    } catch (e) {
      errorMessage.value = 'Error deleting photo: $e';
    }
  }
}