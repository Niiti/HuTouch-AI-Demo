
import 'package:flutter/material.dart';

class PromotionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Implement functionality for promotional banner here
              print("Navigating to promotional activity");
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),

              ),
            ),
          ),
          Image.asset('assets/images/banner.png'),
          // Text(
          //   'PLAY & WIN\nWIN BIG CASH',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}