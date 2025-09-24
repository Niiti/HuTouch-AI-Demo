// lib/features/welcome/presentation/widgets/status_bar.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/color_palette.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('9:41', style: TextStyle(color: ColorPalette.white)),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, color: ColorPalette.white, size: width * 0.05),
              SizedBox(width: width * 0.01),
              Icon(Icons.wifi, color: ColorPalette.white, size: width * 0.05),
              SizedBox(width: width * 0.01),
              Icon(Icons.battery_full, color: ColorPalette.white, size: width * 0.05),
            ],
          )
        ],
      ),
    );
  }
}
