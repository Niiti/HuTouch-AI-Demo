import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourierWidget extends StatelessWidget {
  final String courierName;
  final String courierRole;
  final String courierPhone;
  final String userIconPath;
  final String phoneIconPath;
  final VoidCallback onPhonePressed;

  CourierWidget({
    required this.courierName,
    required this.courierRole,
    required this.courierPhone,
    required this.userIconPath,
    required this.phoneIconPath,
    required this.onPhonePressed,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        CircleAvatar(
          radius: height * 0.04,
          backgroundImage: AssetImage(userIconPath),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courierName,
                style: TextStyle(
                  fontSize: height * 0.022,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF242424),
                ),
              ),
              Text(
                courierRole,
                style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA2A2A2),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onPhonePressed,
          icon: Image.asset(
            phoneIconPath,
            color: Color(0xFFC67C4E),
            height: height * 0.04,
          ),
        ),
      ],
    );
  }
}
