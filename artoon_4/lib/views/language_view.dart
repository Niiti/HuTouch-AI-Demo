import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/language_controller.dart';
import 'widgets/language_item.dart';
import 'widgets/next_button.dart';
import 'widgets/ad_placeholder.dart';

class LanguageView extends StatelessWidget {
  final LanguageController _languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _languageController.languages.length,
                itemBuilder: (context, index) {
                  final language = _languageController.languages[index];
                  return LanguageItem(language: language);
                },
              ),
            ),
          ),
          NextButton(),
          AdPlaceholder(),
        
        ],
      ),
    );
  }
}
