import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/language_selection_view_model.dart';
import 'components/language_list_item.dart';
import 'components/ad_placeholder.dart';
import '../resources/strings.dart';
import '../resources/colors.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LanguageSelectionViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text(Strings.selectLanguageTitle)),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     Strings.selectLanguageTitle,
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.languages.length,
              itemBuilder: (context, index) {
                return LanguageListItem(
                  language: viewModel.languages[index],
                  isSelected:
                      viewModel.selectedLanguage == viewModel.languages[index],
                  onTap: () =>
                      viewModel.selectLanguage(viewModel.languages[index]),
                );
              },
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50, // Set the desired height of the button
                child: ElevatedButton(
                  onPressed: viewModel.selectedLanguage != null
                      ? () => viewModel.proceedToNext(context)
                      : null,
                  child: Text(Strings.nextButton, style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewModel.selectedLanguage != null
                        ? AppColors.buttonEnabled
                        : AppColors.buttonDisabled,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Set the border radius to 0 for no curve
                    ),
                  ),
                ),
              ),
            ),
          
          AdPlaceholder(),
        ],
      ),
    );
  }
}
