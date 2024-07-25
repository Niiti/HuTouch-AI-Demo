import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/language_controller.dart';
import '../../models/language_model.dart';

class LanguageItem extends StatelessWidget {
  final Language language;

  LanguageItem({required this.language});

  @override
  Widget build(BuildContext context) {
    final LanguageController _languageController = Get.find();

    return Card(
      child: ListTile(
        tileColor: Color.fromARGB(255, 253, 253, 253), // Set the color of the ListTile
        leading: CircleAvatar(
          backgroundImage: AssetImage(language.flagPath),
        ),
        title: Text(language.name),
        trailing: Obx(() => Radio<Language>(
          value: language,
          groupValue: _languageController.selectedLanguage.value,
          onChanged: (Language? value) {
        if (value != null) {
          _languageController.selectLanguage(value);
        }
          },
        )),
        onTap: () => _languageController.selectLanguage(language),
      ),

    );
  }
}
