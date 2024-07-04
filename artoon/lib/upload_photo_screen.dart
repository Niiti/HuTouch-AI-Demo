import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'select_gender_screen.dart'; // Import the SelectGenderScreen

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _image1;
  File? _image2;
  final picker = ImagePicker();

  Future<void> _getImage(int imageNumber, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
        } else {
          _image2 = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  void onSkip() {
    Navigator.pop(context); // Navigate back to the previous screen.
  }

  void onCreate() {
    if (_image1 != null || _image2 != null) {
      // Navigate to the SelectGenderScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectGenderScreen()),
      );
    } else {
      // Notify the user that they need to select an image first
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one photo to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload photos of yourself'),
        actions: [
          TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5 - 6 close-up portraits where only you are seen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _getImage(1, ImageSource.gallery),
                  child: _image1 == null
                      ? AddPhotoPlaceholder()
                      : Stack(
                          children: [
                            Image.file(_image1!,
                                width: 120, height: 120, fit: BoxFit.cover),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () => _getImage(1, ImageSource.gallery),
                                child:
                                    Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                ),
                GestureDetector(
                  onTap: () => _getImage(2, ImageSource.gallery),
                  child: _image2 == null
                      ? AddPhotoPlaceholder()
                      : Stack(
                          children: [
                            Image.file(_image2!,
                                width: 120, height: 120, fit: BoxFit.cover),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () => _getImage(2, ImageSource.gallery),
                                child:
                                    Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PhotoButton(
                  title: 'Gallery',
                  icon: Icons.photo_library,
                  onTap: () => _getImage(1, ImageSource.gallery),
                ),
                PhotoButton(
                  title: 'Camera',
                  icon: Icons.camera_alt,
                  onTap: () => _getImage(1, ImageSource.camera),
                ),
                PhotoButton(
                  title: 'Demo',
                  icon: Icons.image,
                  onTap: () {
                    // Add demo image functionality here
                    print('Demo image selected');
                  },
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCreate,
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddPhotoPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
    );
  }
}

class PhotoButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const PhotoButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.blue)),
        ],
      ),
    );
  }
}
