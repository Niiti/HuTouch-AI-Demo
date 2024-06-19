import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'select_gender_screen.dart';

class CreateUploadedPhotoScreen extends StatefulWidget {
  @override
  _CreateUploadedPhotoScreenState createState() =>
      _CreateUploadedPhotoScreenState();
}

class _CreateUploadedPhotoScreenState extends State<CreateUploadedPhotoScreen> {
  final List<XFile> _selectedPhotos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedPhotos.add(image);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedPhotos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload photos of yourself'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation logic
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Skip logic here
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '5 - 6 close-up portraits where only you are seen.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _selectedPhotos.length + 1,
              itemBuilder: (context, index) {
                if (index == _selectedPhotos.length) {
                  return GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.add),
                    ),
                  );
                }
                return Stack(
                  children: [
                    Image.file(
                      File(_selectedPhotos[index].path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedPhotos.length >= 5
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectGenderScreen(),
                        ),
                      );
                    }
                  : null,
              child: Text('Create'),
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
