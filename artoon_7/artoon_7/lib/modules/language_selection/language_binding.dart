
import 'package:get/get.dart';
import 'view_model/language_view_model.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    print("LanguageBinding executed");
    // Get.put(LanguageViewModel());
    Get.lazyPut<LanguageViewModel>(() => LanguageViewModel());
    // Get.lazyPut(()=>LanguageViewModel());
  }
}