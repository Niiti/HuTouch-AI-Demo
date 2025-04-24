import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final double screenHeight;
  const InfoItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(screenHeight * 0.005),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(19, 19, 22, 1),
            borderRadius: BorderRadius.circular(screenHeight * 0.007389),
          ),
          child: Image.asset(
            iconPath,
            height: screenHeight * 0.03,
            // color: const Color.fromRGBO(104, 109, 205, 1),
          ),
        ),
        SizedBox(width: screenHeight * 0.005),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenHeight * 0.01478,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
                color: const Color.fromRGBO(87, 91, 102, 1),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: screenHeight * 0.01970,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}