import 'package:flutter/material.dart';
import 'upload_photo_screen.dart';

class NextButton extends StatelessWidget {
  final List<String> selectedFeatures;

  NextButton({required this.selectedFeatures});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to UploadPhotoScreen if selectedFeatures is not empty
            if (selectedFeatures.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UploadPhotoScreen()), // Navigate to UploadPhotoScreen
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF007BFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// NextScreen to handle the next page after selections
class NextScreen extends StatelessWidget {
  final List<String> selectedFeatures;

  NextScreen({required this.selectedFeatures});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Features'),
      ),
      body: ListView.builder(
        itemCount: selectedFeatures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedFeatures[index]),
          );
        },
      ),
    );
  }
}
