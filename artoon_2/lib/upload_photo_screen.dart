import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'select_gender_screen.dart';

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _image1;
  File? _image2;
  List<File> _selectedImages = [];
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _selectedImages.add(File(pickedFile.path));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Photo selected successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected.')),
        );
      }
    });
  }

  void onSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectGenderScreen()),
    );
  }

  void onCreate() {
    if (_selectedImages.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectGenderScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one photo to proceed.')),
      );
    }
  }

  void removeImage(File image) {
    setState(() {
      _selectedImages.remove(image);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Photo removed.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Upload photos of yourself',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5 - 6 close-up portraits where only you are seen.',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(73, 76, 97, 1),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: _image1 == null
                      ? AddPhotoPlaceholder()
                      : Stack(
                          children: [
                            Image.file(
                              _image1!,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap:
                                    () {},
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
                  icon: Icons.photo_library_outlined,
                  onTap: () => _getImage(ImageSource.gallery),
                ),
                PhotoButton(
                  title: 'Camera',
                  icon: Icons.camera_alt_outlined,
                  onTap: () => _getImage(ImageSource.camera),
                ),
                PhotoButton(
                  title: 'Demo',
                  icon: Icons.photo_filter_outlined,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Demo image selected.')),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               _selectedImages.isEmpty? Text('') : Text('Selected images',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
                Text('${_selectedImages.length} / 6',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ],
            ),
            SizedBox(height: 10),
            _selectedImages.isEmpty
              ? Text('')
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _selectedImages.map((image) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: -5,
                          top: -5,
                          child: GestureDetector(
                            onTap: () => removeImage(image),
                            child: Container(
                                decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                ),
                                child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(Icons.close, color: Colors.black, size: 15),
                                ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCreate,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Create',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: _selectedImages.isNotEmpty
                      ? Colors.blue
                      : Color.fromARGB(255, 74, 87, 99),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class AddPhotoPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height:180,
      child: Image.asset('assets/images/image.png', fit: BoxFit.cover),
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
      child: Container(
        width: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Color.fromRGBO(73, 76, 97, 1)),
            SizedBox(height: 8), 
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(73, 76, 97, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
