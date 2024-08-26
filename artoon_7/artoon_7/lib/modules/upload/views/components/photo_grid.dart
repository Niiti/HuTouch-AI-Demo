import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/upload_view_model.dart';

class PhotoGrid extends StatelessWidget {
  final UploadViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: viewModel.photos.length,
        itemBuilder: (context, index) {
          final photo = viewModel.photos[index];
          return Stack(
            children: [
              // Display local images using Image.file
              Image.file(
                File(photo.filePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () => viewModel.deletePhoto(photo.filePath.split('/').last),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}