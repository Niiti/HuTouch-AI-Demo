import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/strings.dart';
import '../view_models/feature_viewmodel.dart';
import '../widgets/feature_card.dart';
import '../resources/colors.dart';
import 'components/ad_placeholder.dart';

class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Which features do you like the most?'),
      ),
      body: Consumer<FeatureViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.features.length,
                  itemBuilder: (context, index) {
                    return FeatureCard(
                      feature: viewModel.features[index],
                      onTap: () {
                        viewModel.toggleSelection(index);
                      },
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

                  onPressed: () {
                    viewModel.proceedToNext(context);
                  },
                  child: Text(Strings.nextButton,
                  
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.selectedBorder,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0), // Set the border radius to 0 for no curve
                    ),
                  ),
                ),
              ),),
                          AdPlaceholder(),

            ],
          );
        },
      ),

    );
  }
}
