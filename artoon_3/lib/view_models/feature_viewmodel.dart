import 'package:flutter/material.dart';
import '../models/feature_model.dart';
import '../views/upload_photo_screen.dart';

class FeatureViewModel extends ChangeNotifier {
  List<Feature> _features = [
    Feature(
      title: 'AI Art',
      description: 'Elevate your pictures with advanced face swapping.',
      icon: 'assets/icons/ai_art.png',
    ),
    Feature(
      title: 'AI Enhance',
      description: 'Enhance your image quality',
      icon: 'assets/icons/ai_enhance.png',
    ),
    // Add other features here
    Feature(
      title: 'AI Avatar',
      description: 'Transform your selfie into diverse avatar styles',
      icon: 'assets/icons/ai_avatar.png',
    ),
    Feature(
      title: 'Text to Image',
      description: 'Turn text into personalized avatars',
      icon: 'assets/icons/text_to_image.png',
    ),
    Feature(
      title: 'Face Me',
      description: 'Lorem Ipsum is simply dummy text',
      icon: 'assets/icons/face_me.png',
    ),
  ];

  List<Feature> get features => _features;

  void toggleSelection(int index) {
    _features[index] = _features[index].copyWith(
      isSelected: !_features[index].isSelected,
    );
    notifyListeners();
  }

  void proceedToNext(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadPhotoScreen()),
    );
  }
}
