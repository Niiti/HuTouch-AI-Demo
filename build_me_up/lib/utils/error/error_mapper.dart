import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/utils/error/app_exception.dart';

class ErrorMapper {
  static String messageFromException(AppException e) {
    if (e is NetworkException) return e.message;
    if (e is ValidationException) return e.message;
    return AppStrings.somethingWentWrong;
  }
}
