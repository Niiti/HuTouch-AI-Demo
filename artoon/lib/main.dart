import 'package:flutter/material.dart';
import 'header_section.dart';
import 'features_list.dart';
import 'next_button.dart';

// Main entry point of the application
void main() {
  runApp(MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feature Selection'),
        ),
        body: FeatureSelectionScreen(),
      ),
    );
  }
}

// Feature selection screen widget
class FeatureSelectionScreen extends StatefulWidget {
  @override
  _FeatureSelectionScreenState createState() => _FeatureSelectionScreenState();
}

class _FeatureSelectionScreenState extends State<FeatureSelectionScreen> {
  // List to keep track of selected features
  List<String> selectedFeatures = [];

  void toggleFeatureSelection(String feature) {
    setState(() {
      if (selectedFeatures.contains(feature)) {
        selectedFeatures.remove(feature);
      } else {
        selectedFeatures.add(feature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(),
        Expanded(
            child: FeaturesList(
                onFeatureToggled: toggleFeatureSelection,
                selectedFeatures: selectedFeatures)),
        NextButton(selectedFeatures: selectedFeatures),
      ],
    );
  }
}
