import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cx;
import 'package:build_me_up/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:build_me_up/services/auth/data_sources/auth_remote_data_source_impl.dart';
import 'package:build_me_up/services/auth/repositories/auth_repository_impl.dart';
import 'package:build_me_up/shared/components/input-text-field.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  SignUpController get controller =>
      Get.put(SignUpController(AuthRepositoryImpl(AuthRemoteDataSourceImpl())));

  @override
  Widget build(BuildContext context) {
    final h = context.screenHeight;
    final w = context.screenWidth;
    final isPortrait = cx.ContextExtensionss(context).isPortrait;

    final horizontalPadding = w * AppDimensions.contentHPadPct;
    final inputHeight = h * AppDimensions.buttonHeightPct;
    final buttonHeight = h * AppDimensions.buttonHeightPct;
    final buttonRadius = Radius.circular(
      h * AppDimensions.buttonRadiusPctOfHeight,
    );

    final content = Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          SizedBox(height: h * AppDimensions.logoTopSpacerPct),
          Text(
            AppStrings.createAccount,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.brand,
              fontWeight: FontWeight.w700,
              fontSize: h * AppDimensions.titleFontPctOfH,
            ),
          ),
          SizedBox(height: h * 0.012),
          Text(
            AppStrings.startJourney,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: h * 0.023758,
            ),
          ),
          SizedBox(height: h * 0.04),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: AppDimensions.buttonWidthFactor,
                  child: InputTextField(
                    height: inputHeight,
                    hintText: AppStrings.name,
                    controller: controller.nameCtrl,
                  ),
                ),
                SizedBox(height: h * 0.02),
                FractionallySizedBox(
                  widthFactor: AppDimensions.buttonWidthFactor,
                  child: InputTextField(
                    height: inputHeight,
                    hintText: AppStrings.email,
                    controller: controller.emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: h * 0.02),
                FractionallySizedBox(
                  widthFactor: AppDimensions.buttonWidthFactor,
                  child: InputTextField(
                    height: inputHeight,
                    hintText: AppStrings.password,
                    controller: controller.passwordCtrl,
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.04),
          Obx(
            () => FractionallySizedBox(
              widthFactor: AppDimensions.buttonWidthFactor,
              child: PrimaryButton(
                text: AppStrings.signUp,
                onPressed: controller.onSignUpPressed,
                enabled:
                    controller.canSubmit.value && !controller.isLoading.value,
                height: buttonHeight,
                borderRadius: BorderRadius.all(buttonRadius),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: h * 0.023758,
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.02),
          Text(
            AppStrings.orSignUp,
            style: TextStyle(
              fontSize: h * 0.017278,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: h * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                path: AppImages.google,
                onTap: controller.onGooglePressed,
              ),
              SizedBox(width: w * 0.08),
              _SocialIcon(
                path: AppImages.apple,
                onTap: controller.onApplePressed,
              ),
              SizedBox(width: w * 0.08),
              _SocialIcon(
                path: AppImages.facebook,
                onTap: controller.onFacebookPressed,
              ),
            ],
          ),
          SizedBox(height: h * 0.06),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                AppStrings.haveAccount,
                style: TextStyle(
                  fontSize: h * 0.017278,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: controller.onSignInNav,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.005,
                      vertical: h * 0.004,
                    ),
                    child: Text(
                      AppStrings.signIn,
                      style: TextStyle(
                        fontSize: h * 0.017278,
                        fontWeight: FontWeight.w600,
                        color: AppColors.link,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!isPortrait) SizedBox(height: h * 0.02),
        ],
      ),
    );

    final mustScroll = h < 640 || ContextExtensionss(context).isLandscape;

    return Scaffold(
      body: SafeArea(
        child:
            mustScroll
                ? Scrollbar(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: content,
                  ),
                )
                : content,
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.path, required this.onTap});
  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = context.screenHeight * 0.0367;
    final r = BorderRadius.circular(size);
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: r,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: r,
        child: Padding(
          padding: EdgeInsets.all(size * 0.25),
          child: Image.asset(
            path,
            width: size,
            height: size,
            color: AppColors.brand,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
