import 'package:flutter/material.dart';
import '../constants/constants.dart';

class HeartIconWidget extends StatelessWidget {
  const HeartIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 92,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Vanessa.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(
              Icons.favorite,
              color: AppColors.whiteColor,
              size: 32,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          '32',
          style: AppTextStyles.numberTextStyle,
        ),
      ],
    );
  }
}