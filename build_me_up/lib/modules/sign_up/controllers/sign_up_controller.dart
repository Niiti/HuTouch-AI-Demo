import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/services/auth/repositories/i_auth_repository.dart';
import 'package:build_me_up/utils/error/app_exception.dart';
import 'package:build_me_up/utils/error/error_mapper.dart';

class SignUpController extends GetxController {
  SignUpController(this._repository);
  final IAuthRepository _repository;

  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final isLoading = false.obs;
  final errorMessage = RxnString();
  final canSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameCtrl.addListener(_onChanged);
    emailCtrl.addListener(_onChanged);
    passwordCtrl.addListener(_onChanged);
  }

  void _onChanged() {
    final ok =
        nameCtrl.text.trim().isNotEmpty &&
        _isValidEmail(emailCtrl.text.trim()) &&
        passwordCtrl.text.length >= 6;
    canSubmit.value = ok;
  }

  String? validateName(String? v) {
    if (v == null || v.trim().isEmpty) return AppStrings.fieldRequired;
    return null;
  }

  String? validateEmail(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return AppStrings.fieldRequired;
    if (!_isValidEmail(value)) return AppStrings.emailInvalid;
    return null;
  }

  String? validatePassword(String? v) {
    final value = v ?? '';
    if (value.isEmpty) return AppStrings.fieldRequired;
    if (value.length < 6) return AppStrings.passwordInvalid;
    return null;
  }

  bool _isValidEmail(String email) {
    final r = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');
    return r.hasMatch(email);
  }

  Future<void> onSignUpPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    errorMessage.value = null;
    try {
      await _repository.register(
        name: nameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text,
      );
      Get.snackbar(
        'Success',
        'Account created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on AppException catch (e) {
      errorMessage.value = ErrorMapper.messageFromException(e);
      Get.snackbar(
        'Error',
        errorMessage.value ?? AppStrings.somethingWentWrong,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      errorMessage.value = AppStrings.somethingWentWrong;
      Get.snackbar(
        'Error',
        errorMessage.value!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onGooglePressed() async {
    Get.snackbar(
      'Google',
      'Sign up with Google',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> onApplePressed() async {
    Get.snackbar(
      'Apple',
      'Sign up with Apple',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> onFacebookPressed() async {
    Get.snackbar(
      'Facebook',
      'Sign up with Facebook',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onSignInNav() {
    Get.toNamed('/sign-in');
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}
