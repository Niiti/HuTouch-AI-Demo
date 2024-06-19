import 'package:flutter/material.dart';
import 'features_selection_screen.dart';

class SelectLanguageScreen extends StatefulWidget {
  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String _selectedLanguage = "English"; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildLanguageOption('English', 'assets/images/image.png'),
                _buildLanguageOption('Arabic', 'assets/images/image.png'),
                _buildLanguageOption('Spanish', 'assets/images/image.png'),
                _buildLanguageOption('French', 'assets/images/image.png'),
                _buildLanguageOption('German', 'assets/images/image.png'),
                _buildLanguageOption('Hindi', 'assets/images/image.png'),
                _buildLanguageOption(
                    'Portuguese', 'assets/images/image.png'),
                _buildLanguageOption('Korean', 'assets/images/image.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeaturesSelectionScreen(),
                  ),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // full width button
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              color: Colors.grey[300], // Placeholder for ads
              child: Center(child: Text("Ad Placeholder")),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language, String iconPath) {
    return ListTile(
      leading: Image.asset(iconPath,
          width: 30, height: 30), // Replace with actual icon paths
      title: Text(language),
      trailing: Radio<String>(
        value: language,
        groupValue: _selectedLanguage,
        onChanged: (value) {
          setState(() {
            _selectedLanguage = value!;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
    );
  }
}
