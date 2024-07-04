
import 'package:flutter/material.dart';
// import 'ai_art_home_screen.dart'; // Import the AI Art Home Screen
import 'upload_photo_screen.dart';
import 'ad_banner.dart';

class FeaturesScreen extends StatefulWidget {
  @override
  _FeaturesScreenState createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  String selectedFeature = '';

  void onFeatureSelected(String feature) {
    setState(() {
      selectedFeature = feature;
    });
  }

  void onNext() {
    if (selectedFeature.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadPhotoScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a feature to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Which features do you like the most?',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
        ),
        backgroundColor: Colors.white,),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  FeatureItem(
                    title: 'AI Art',
                    description: 'Elevate your pictures with advanced face swapping.',
                    icon: Icons.art_track_outlined,
                    onTap: () => onFeatureSelected('AI Art'),
                    isSelected: selectedFeature == 'AI Art',
                  ),
                  FeatureItem(
                    title: 'AI Enhance',
                    description: 'Enhance your image quality.',
                    icon: Icons.auto_fix_high_outlined,
                    onTap: () => onFeatureSelected('AI Enhance'),
                    isSelected: selectedFeature == 'AI Enhance',
                  ),
                  FeatureItem(
                    title: 'AI Avatar',
                    description: 'Transform your selfie into diverse avatar styles.',
                    icon: Icons.auto_awesome,
                    onTap: () => onFeatureSelected('AI Avatar'),
                    isSelected: selectedFeature == 'AI Avatar',
                  ),
                  FeatureItem(
                    title: 'Text to Image',
                    description: 'Turn text into personalized avatars.',
                    icon: Icons.transform_outlined,
                    onTap: () => onFeatureSelected('Text to Image'),
                    isSelected: selectedFeature == 'Text to Image',
                  ),
                  FeatureItem(
                    title: 'Face Me',
                    description: 'Lorem Ipsum is simply dummy text.',
                    icon: Icons.tag_faces,
                    onTap: () => onFeatureSelected('Face Me'),
                    isSelected: selectedFeature == 'Face Me',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),
              ),
              ),
            ),
          AdBanner(),
            ]
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:isSelected ? Colors.blue[50] : Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: isSelected ? Colors.blue : Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        // leading: isSelected ? Icon(Icons.voice_over_off_outlined, color: Colors.blue) : null,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: onTap,
        trailing: Icon(icon), // Add this line to place the icon on the other side
      ),
    );
  }
}
