import 'package:flutter/material.dart';
import 'create_uploaded_photo_screen.dart';

class Feature {
  final String name;
  final String description;
  final IconData icon;

  Feature({required this.name, required this.description, required this.icon});
}

class FeaturesSelectionScreen extends StatefulWidget {
  @override
  _FeaturesSelectionScreenState createState() =>
      _FeaturesSelectionScreenState();
}

class _FeaturesSelectionScreenState extends State<FeaturesSelectionScreen> {
  final List<Feature> _features = [
    Feature(
        name: 'AI Art',
        description: 'Elevate your pictures with advanced face swapping.',
        icon: Icons.brush),
    Feature(
        name: 'AI Enhance',
        description: 'Enhance your image quality',
        icon: Icons.enhance_photo_translate),
    Feature(
        name: 'AI Avatar',
        description: 'Transform your selfie into diverse avatar styles',
        icon: Icons.face_retouching_natural),
    Feature(
        name: 'Text to Image',
        description: 'Turn text into personalized avatars',
        icon: Icons.text_fields),
    Feature(
        name: 'Face Me',
        description: 'Lorem Ipsum is simply dummy text',
        icon: Icons.face),
  ];

  void _selectFeature(String featureName) {
    // Logic for when a feature is selected
    print("$featureName selected.");
    // Additional logic can be added here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Which features do you like the most?'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation logic
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _features.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(_features[index].icon),
                  title: Text(_features[index].name),
                  subtitle: Text(_features[index].description),
                  onTap: () {
                    _selectFeature(_features[index].name);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey[300],
              height: 100,
              child: Center(
                child: Text(
                  'Ad Placeholder',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateUploadedPhotoScreen(),
                  ),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // full width button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
