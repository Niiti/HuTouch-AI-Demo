import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/avatar_model.dart';
import '../../view_model/avatar_view_model.dart';

class TrendingSection extends StatelessWidget {
  final avatarViewModel = Get.find<AvatarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
            child: Image.network(
              'https://picsum.photos/id/64/200/300',
              width: double.infinity,
              height: 234,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              'AUTUMN 3D',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () => avatarViewModel
                  .tryAvatar(Avatar(title: 'AUTUMN 3D', imageUrl: '')),
              child: Text(
                'Try Now',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
