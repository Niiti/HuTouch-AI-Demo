import 'package:flutter/material.dart';

class PlayWinBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      // color: Colors.red,
      child: Image.asset(
        'assets/images/banner.png',
        width: MediaQuery.of(context).size.width, 
        fit: BoxFit.contain,
      ),
    );
  }
}
