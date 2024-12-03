import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class AvatarWidget extends StatelessWidget {
  final String image;
  final String name;
  final double width;

  const AvatarWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: width * 0.07,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: width * 0.03,
                  height: width * 0.03,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: width * 0.01),
          Text(
            name,
            style: TextStyle(fontSize: width * 0.03),
          ),
        ],
      ),
    );
  }
}
