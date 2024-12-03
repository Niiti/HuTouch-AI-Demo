import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipely/login_screen/ui/widgets/background_elements.dart';
import 'package:recipely/login_screen/ui/widgets/footer.dart';
import 'package:recipely/login_screen/ui/widgets/header.dart';
import 'package:recipely/login_screen/ui/widgets/main_options.dart';
import 'package:recipely/login_screen/data/app_constants.dart';

class LoginUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundElements(),
            Header(),
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: Text(
                        'Help your path to health\ngoals with happiness',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                MainOptions(),
                Footer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
