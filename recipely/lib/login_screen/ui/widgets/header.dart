import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: TextButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          child: Text(
            'Later',
            style: TextStyle(
              color: Colors.white,
              fontSize: height * 0.018,
            ),
          ),
        ),
      ),
    );
  }
}
