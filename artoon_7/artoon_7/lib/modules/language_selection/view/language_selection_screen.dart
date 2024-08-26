import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/language_view_model.dart';
import 'language_item.dart';
import 'ad_section.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final LanguageViewModel languageViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // Hide the app bar
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Language',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(1, 1, 1, 1),
                  ),
                ),
              )),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: languageViewModel.languages.length,
                itemBuilder: (context, index) {
                  final language = languageViewModel.languages[index];
                  return LanguageItem(
                    language: language.name,
                    flag: language.flag,
                    isSelected: languageViewModel.selectedLanguage.value ==
                        language.name,
                    onSelected: languageViewModel.selectLanguage,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ElevatedButton(
              onPressed: languageViewModel.next,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 122, 255, 1), // Button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(double.infinity, 54),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          AdSection(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Loading...',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
