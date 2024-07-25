import 'dart:io';

import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoViewModel extends ChangeNotifier {
  List<PhotoModel> _photos = [];

  List<PhotoModel> get photos => _photos;

  void addPhoto(PhotoModel photo) {
    _photos.add(photo);
    notifyListeners();
  }

  void removePhoto(String id) {
    _photos.removeWhere((photo) => photo.id == id);
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      addPhoto(
        PhotoModel(
          id: DateTime.now().toString(),
          image: FileImage(File(pickedFile.path)),
        ),
      );
    }
  }
}
