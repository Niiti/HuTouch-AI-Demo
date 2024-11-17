import 'package:get/get.dart';
import '../models/feature_model.dart';
import '../utils/app_colors.dart';

class FeatureController extends GetxController {
  var features = <FeatureModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFeatures();
  }

  void loadFeatures() {
    features.assignAll([
      FeatureModel(
        iconPath: 'assets/icons/ai_art.png',
        mainText: 'AI Art',
        subText: 'Elevate your pictures with advanced face swapping.',
        outlineColor: AppColors.blueOutlineColor,
        fillColor: AppColors.fillColorBlue,
        shadowColor: AppColors.shadowColor,
      ),
      FeatureModel(
        iconPath: 'assets/icons/ai_enhance.png',
        mainText: 'AI Enhance',
        subText: 'Enhance your image quality.',
        outlineColor: AppColors.grayOutlineColor,
        fillColor: AppColors.whiteColor,
        shadowColor: AppColors.shadowColor,
      ),
      FeatureModel(
        iconPath: 'assets/icons/ai_avatar.png',
        mainText: 'AI Avatar',
        subText: 'Transform your selfie into diverse avatar styles.',
        outlineColor: AppColors.grayOutlineColor,
        fillColor: AppColors.whiteColor,
        shadowColor: AppColors.shadowColor,
      ),
      FeatureModel(
        iconPath: 'assets/icons/text_to_image.png',
        mainText: 'Text to Image',
        subText: 'Turn text into personalized avatars.',
        outlineColor: AppColors.grayOutlineColor,
        fillColor: AppColors.whiteColor,
        shadowColor: AppColors.shadowColor,
      ),
      FeatureModel(
        iconPath: 'assets/icons/face_me.png',
        mainText: 'Face Me',
        subText: 'Lorem Ipsum is simply dummy text.',
        outlineColor: AppColors.grayOutlineColor,
        fillColor: AppColors.whiteColor,
        shadowColor: AppColors.shadowColor,
      ),
    ]);
  }
}