import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/custom_text_field.dart';
import '../../../utils/app_constants.dart';
import '../Feed.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05;
    final fontSize = MediaQuery.of(context).size.height * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset(ImagesAsset.xIcon),
                      iconSize: fontSize * 1.5,
                      onPressed: () {},
                    ),
                    Text(
                      AppString.signUp,
                      style: TextStyle(
                        fontSize: fontSize * 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        AppString.login,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Color.fromRGBO(93, 176, 116, 1),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: padding * 2),
                Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: AppString.name,
                        fontSize: fontSize,
                      ),
                      SizedBox(height: padding),
                      CustomTextField(
                        hintText: AppString.email,
                        fontSize: fontSize,
                      ),
                      SizedBox(height: padding),
                      Obx(() => CustomTextField(
                            hintText: AppString.password,
                            fontSize: fontSize,
                            obscureText: !controller.isPasswordVisible.value,
                            suffixWidget: InkWell(
                              child: Text(
                                controller.isPasswordVisible.value
                                    ? 'Hide'
                                    : AppString.show,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Color.fromRGBO(93, 176, 116, 1),
                                ),
                              ),
                              onTap: () {
                                controller.togglePasswordVisibility();
                              },
                            ),
                          )),
                      SizedBox(height: padding),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: controller
                                    .selectedLanguage.value.isNotEmpty,
                                onChanged: (bool? value) {
                                  // Handle checkbox change
                                },
                                side: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 230, 223, 223),
                                    width: 2),
                              )),
                          Expanded(
                            child: Text(
                              AppString.newsletter,
                              style: TextStyle(
                                fontSize: fontSize * 0.8,
                                color: Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 2),
                     ElevatedButton(
  onPressed: () {
    // Perform any sign-up logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GeneratedUI()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromRGBO(93, 176, 116, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    minimumSize: Size(double.infinity, 50),
  ),
  child: Text(
    AppString.signUp,
    style: TextStyle(
      fontSize: fontSize,
      color: Colors.white,
    ),
  ),
),

                      SizedBox(height: padding),
                      InkWell(
                        child: Text(
                          AppString.forgotPassword,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Color.fromRGBO(93, 176, 116, 1),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
