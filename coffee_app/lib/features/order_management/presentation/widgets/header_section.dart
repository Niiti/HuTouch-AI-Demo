import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class HeaderSection extends StatelessWidget {
  final double width;

  const HeaderSection({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, size: width * 0.06),
          onPressed: () {
            // Implement back button functionality
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Text(
            'Order',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: AppConstants.textColor,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.signal_cellular_alt, size: width * 0.04),
            SizedBox(width: width * 0.01),
            Icon(Icons.wifi, size: width * 0.04),
            SizedBox(width: width * 0.01),
            Icon(Icons.battery_full, size: width * 0.04),
          ],
        ),
      ],
    );
  }
}
