import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/logger.dart';
import '../bloc/generated_ui_bloc.dart';
import '../bloc/generated_ui_event.dart';
import '../bloc/generated_ui_state.dart';
import 'package:go_router/go_router.dart';
class GeneratedUIPage extends StatelessWidget {
  const GeneratedUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocListener<GeneratedUIBloc, GeneratedUIState>(
      listener: (context, state) {
        // Handle state changes if necessary
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41',
                      style: TextStyle(
                          color: Colors.white, fontSize: height * 0.022),
                    ),
                    Row(
                      children: [
                        Icon(Icons.network_wifi,
                            color: Colors.white, size: height * 0.025),
                        SizedBox(width: width * 0.02),
                        Icon(Icons.battery_full,
                            color: Colors.white, size: height * 0.025),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    AppConstants.coffeeBackground,
                    fit: BoxFit.contain,
                    width: width,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppConstants.soraFont,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppConstants.soraFont,
                        color: Color.fromRGBO(162, 162, 162, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.2, vertical: height * 0.03),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD2691E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(height * 0.02),
                    ),
                  ),
                  onPressed: () {
                    context.go('/coffee_catalogue');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.018),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: height * 0.022,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppConstants.soraFont,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.007,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
