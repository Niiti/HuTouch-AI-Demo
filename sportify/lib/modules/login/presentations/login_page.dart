import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_buttons.dart';
import '../../../utils/error_handler.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../../../utils/responsive_util.dart';
import '../widgets/triangular_clipper.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final double height = ResponsiveUtil.getHeight(context);
    final double width = ResponsiveUtil.getWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              LoginHeader(width: width),
              SizedBox(height: height * 0.03),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    AppString.signInWithId,
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Use white color for text
                      fontFamily: 'Bebas Neue',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppValues.paddingHorizontal,
                ),
                child: LoginForm(width: width, height: height),
              ),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppValues.paddingHorizontal,
                ),
                child: LoginButtons(width: width, height: height),
              ),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppValues.paddingHorizontal,
                ),
                child: Text(
                  AppString.accountInfo,
                  style: TextStyle(
                    fontSize: width * 0.036,
                    color: AppColors.hintColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppValues.paddingHorizontal,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.dividerColor,
                        thickness: AppValues.dividerThickness,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        AppString.or,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.dividerColor,
                        thickness: AppValues.dividerThickness,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppValues.paddingHorizontal,
                ),
                child: GestureDetector(
                  onTap: controller.signUp,
                  child: ClipPath(
                    clipper: TriangularClipper(),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.07,
                      color: AppColors.alternateButtonColor,
                      child: Center(
                        child: Text(
                          AppString.signUp,
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: AppColors.alternateButtonTextColor,
                            fontFamily: 'Bebas Neue',
                          ),
                        ),
                      ),
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
