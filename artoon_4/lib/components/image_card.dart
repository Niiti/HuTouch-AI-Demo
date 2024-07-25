import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final ImageProvider image;
  final bool isSelected;
  final VoidCallback onClose;

  ImageCard(
      {required this.image, this.isSelected = false, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 88,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        if (isSelected)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onClose,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
