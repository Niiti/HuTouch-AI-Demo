import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              minimumSize: Size(double.infinity, height * 0.065),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: height * 0.022,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        TextButton(
          onPressed: () {
            Get.toNamed('/signup');
          },
          child: Text(
            'Create New Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: height * 0.018,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
