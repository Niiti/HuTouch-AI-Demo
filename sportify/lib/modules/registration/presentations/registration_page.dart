import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../widgets/header_section.dart';
import '../widgets/input_field.dart';
import '../widgets/terms_and_conditions.dart';
import '../widgets/submit_button.dart';
import '../widgets/footer_image.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // Pass dimensions to child widgets if needed
              HeaderSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    InputField(
                      hintText: 'First Name',
                      obscureText: false,
                    ),
                    SizedBox(height: height * 0.02),
                    InputField(
                      hintText: 'Last Name',
                      obscureText: false,
                    ),
                    SizedBox(height: height * 0.02),
                    InputField(
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    SizedBox(height: height * 0.02),
                    InputField(
                      hintText: 'Password',
                      obscureText: true,
                      helperText:
                          'Password must be at least 8 characters long and include 1 capital letter and 1 symbol',
                    ),
                    SizedBox(height: height * 0.02),
                    TermsAndConditions(),
                    SizedBox(height: height * 0.02),
                    SubmitButton(),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppString.consentText,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: AppColors.helperTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
