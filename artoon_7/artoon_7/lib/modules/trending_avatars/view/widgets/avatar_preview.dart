
import 'package:flutter/material.dart';

class AvatarPreviewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(child: AvatarPreview()),
            Expanded(child: AvatarPreview()),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: AvatarPreview()),
            Expanded(child: AvatarPreview()),
          ],
        ),
      ],
    );
  }
}

class AvatarPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: GestureDetector(
              onTap: () {
                // Implement functionality for avatar preview here
                print("Navigating to detailed view of AUTUMN 3D avatar");
              },
              child: Image.network(
                'https://picsum.photos/id/58/300/200',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'AUTUMN 3D',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}