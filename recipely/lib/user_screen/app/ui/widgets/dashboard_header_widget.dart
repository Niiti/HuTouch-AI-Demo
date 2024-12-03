import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/design_constants.dart';
import '../../../core/utils/responsive_helper.dart';

class DashboardHeaderWidget extends StatelessWidget {
  final Size size;

  const DashboardHeaderWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      child: Stack(
        children: [
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.settings, color: AppColors.iconColor),
              onPressed: () {
                // Handle settings action
              },
            ),
          ),
        ],
      ),
    );
  }
}
