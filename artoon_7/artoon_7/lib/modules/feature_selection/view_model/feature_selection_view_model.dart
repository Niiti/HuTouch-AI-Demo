import 'package:get/get.dart';
import '../model/feature_model.dart';

/// ViewModel class for managing the state of the feature selection screen.
class FeatureSelectionViewModel extends GetxController {
  var selectedFeature = 'AI Art'.obs;

  var features = <Feature>[
    Feature(
      title: 'AI Art',
      description: 'Elevate your pictures with advanced face swapping.',
      icon: 'assets/icons/ai_art.png',
    ),
    Feature(
      title: 'AI Enhance',
      description: 'Enhance your image quality.',
      icon: 'assets/icons/ai_enhance.png',
    ),
    Feature(
      title: 'AI Avatar',
      description: 'Transform your selfie into diverse avatar styles.',
      icon: 'assets/icons/ai_avatar.png',
    ),
    Feature(
      title: 'Text to Image',
      description: 'Turn text into personalized avatars.',
      icon: 'assets/icons/text_to_image.png',
    ),
    Feature(
      title: 'Face Me',
      description: 'Lorem Ipsum is simply dummy text.',
      icon: 'assets/icons/face_me.png',
    ),
  ].obs;

  /// Select a feature.
  void selectFeature(String featureTitle) {
    selectedFeature.value = featureTitle;
  }
}