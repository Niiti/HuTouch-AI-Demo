import 'package:flutter/material.dart';
import 'feature_item.dart';

class FeaturesList extends StatelessWidget {
  final Function(String) onFeatureToggled;
  final List<String> selectedFeatures;

  FeaturesList(
      {required this.onFeatureToggled, required this.selectedFeatures});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FeatureItem(
          label: 'AI Art',
          description: 'Elevate your pictures with advanced face swapping.',
          icon: Icons.face,
          isSelected: selectedFeatures.contains('AI Art'),
          onTap: () => onFeatureToggled('AI Art'),
        ),
        FeatureItem(
          label: 'AI Enhance',
          description: 'Enhance your image quality',
          icon: Icons.enhance_photo_translate,
          isSelected: selectedFeatures.contains('AI Enhance'),
          onTap: () => onFeatureToggled('AI Enhance'),
        ),
        FeatureItem(
          label: 'AI Avatar',
          description: 'Transform your selfie into diverse avatar styles',
          icon: Icons.person_pin,
          isSelected: selectedFeatures.contains('AI Avatar'),
          onTap: () => onFeatureToggled('AI Avatar'),
        ),
        FeatureItem(
          label: 'Text to Image',
          description: 'Turn text into personalized avatars',
          icon: Icons.text_fields,
          isSelected: selectedFeatures.contains('Text to Image'),
          onTap: () => onFeatureToggled('Text to Image'),
        ),
        FeatureItem(
          label: 'Face Me',
          description: 'Lorem Ipsum is simply dummy text',
          icon: Icons.tag_faces,
          isSelected: selectedFeatures.contains('Face Me'),
          onTap: () => onFeatureToggled('Face Me'),
        ),
      ],
    );
  }
}
