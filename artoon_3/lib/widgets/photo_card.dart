import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onDelete;

  PhotoCard({required this.image, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: image, width: 72, height: 72, fit: BoxFit.cover),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onDelete,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.close, size: 16, color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
