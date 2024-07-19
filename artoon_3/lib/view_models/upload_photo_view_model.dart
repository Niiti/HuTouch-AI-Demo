import 'package:flutter/material.dart';
import '../views/gender_selection_screen.dart';

class UploadPhotoViewModel extends ChangeNotifier {
  void uploadPhoto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenderSelectionScreen()),
    );
  }

  void skip(BuildContext context) {
    Navigator.pop(context);
  }

  void openGallery(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Open gallery button pressed')),
    );
  }

  void openCamera(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Open camera button pressed')),
    );
  }

  void photoTapped(BuildContext context, String photoUrl) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Photo tapped: $photoUrl')),
    );
  }
}
