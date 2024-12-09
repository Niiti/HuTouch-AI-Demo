import 'package:flutter/material.dart';
class HeaderWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onGpsPressed;
  final String leftIconPath;
  final String gpsIconPath;

  HeaderWidget({
    required this.onBackPressed,
    required this.onGpsPressed,
    required this.leftIconPath,
    required this.gpsIconPath,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset(leftIconPath,width: 50,height: 50,),
            onPressed: onBackPressed,
          ),
          IconButton(
            icon: Image.asset(gpsIconPath,width: 50,height: 50),
            onPressed: onGpsPressed,
          ),
        ],
      ),
    );
  }
}
