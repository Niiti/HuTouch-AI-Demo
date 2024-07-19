import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/gender_selection_viewmodel.dart';
import '../widgets/gender_option.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';

class GenderSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<GenderSelectionViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.genderSelectionTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.genderSelectionHeader,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  Strings.genderSelectionSubHeader,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.subHeaderText,
                  ),
                ),
              ],
            ),
          ),
          GenderOption(
            optionText: Strings.genderOptionWoman,
            descriptionText: Strings.genderOptionDescription,
            icon: Icons.female,
            isSelected: viewModel.selectedGender == Gender.Woman,
            onTap: () => viewModel.selectGender(Gender.Woman),
          ),
          GenderOption(
            optionText: Strings.genderOptionMan,
            descriptionText: Strings.genderOptionDescription,
            icon: Icons.male,
            isSelected: viewModel.selectedGender == Gender.Man,
            onTap: () => viewModel.selectGender(Gender.Man),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: viewModel.selectedGender != null
                  ? () => viewModel.proceedToNext(context)
                  : null,
              child: Text(Strings.createAvatars,
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.selectedGender != null
                    ? AppColors.buttonEnabled
                    : AppColors.buttonDisabled,
                fixedSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Container(
            height: 217,
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ad content here"),
                  SizedBox(height: 4),
                  CircularProgressIndicator(),
                  SizedBox(height: 4),
                  Text("Loading ad..."),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
