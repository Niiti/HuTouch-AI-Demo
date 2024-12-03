import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/constants/design_constants.dart';
import '../../../core/utils/responsive_helper.dart';

class UserProfileWidget extends StatelessWidget {
  final Size size;
  final DashboardController controller;

  UserProfileWidget({Key? key, required this.size})
      : controller = Get.find(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Row(
            children: [
              CircleAvatar(
                radius: size.width * 0.1,
                backgroundImage: AssetImage('assets/user1.png'),
              ),
              SizedBox(width: size.width * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alena Sabyan',
                    style: TextStyle(
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    'Recipe Developer',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () {
                    // Handle navigation action
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
