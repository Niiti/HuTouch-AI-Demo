import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/upload_photo_view_model.dart';
import '../resources/colors.dart';
import '../resources/strings.dart'; // Import the library that defines 'uploadTitle'
import '../widgets/common_button.dart';
import '../widgets/photo_card.dart';

class UploadPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadPhotoViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            Strings.uploadTitle, // Use the correct name for the getter
            style: TextStyle(
              color: AppColors.titleColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  context.read<UploadPhotoViewModel>().skip(context),
              child: Text(
                Strings.skipText,
                style: TextStyle(
                    color: AppColors.skipColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to start (left)
            children: [
              Text(
                Strings.uploadSubtitle,
                style: TextStyle(
                  color: AppColors.subtitleColor,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center-align the photo cards
                children: [
                  PhotoCard(
                    photoUrl: 'https://picsum.photos/200/300?grayscale',
                    onTap: () => context
                        .read<UploadPhotoViewModel>()
                        .photoTapped(context, 'https://picsum.photos/200/300?grayscale'),
                  ),
                  SizedBox(width: 10), // Add spacing between photo cards
                  PhotoCard(
                    photoUrl: 'https://picsum.photos/200/300?grayscale',
                    onTap: () => context
                        .read<UploadPhotoViewModel>()
                        .photoTapped(context, 'https://picsum.photos/200/300?grayscale'),
                    isDemo: true,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => context
                        .read<UploadPhotoViewModel>()
                        .openGallery(context),
                    child: Column(
                      children: [
                        Icon(Icons.photo),
                        Text(Strings.galleryText),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => context
                        .read<UploadPhotoViewModel>()
                        .openCamera(context),
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt),
                        Text(Strings.cameraText),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      40), // Add extra space between buttons and create button
              CommonButton(
                text: Strings.createText,
                onPressed: () =>
                    context.read<UploadPhotoViewModel>().uploadPhoto(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
