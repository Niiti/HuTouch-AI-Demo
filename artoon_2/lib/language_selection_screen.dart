import 'package:flutter/material.dart';
import 'next_button.dart';
import 'ad_banner.dart';
import 'features_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Language',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(languages.length, (index) {
                  return LanguageOption(
                    language: languages[index],
                    isSelected: _selectedLanguage == languages[index]['name'],
                    onSelect: (String selectedLanguage) {
                      setState(() {
                        _selectedLanguage = selectedLanguage;
                      });
                    },
                  );
                }),
              ),
            ),
            NextButton(
              isEnabled: _selectedLanguage != null,
              onPressed: () {
                if (_selectedLanguage == null) {
                  _showErrorMessage(context, "Please select a language");
                } else {
                  _goToNextScreen(context);
                }
              },
            ),
            SizedBox(height: 0),
            AdBanner(),
          ],
        ),
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToNextScreen(BuildContext context) {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FeaturesScreen()), // Implement NextScreen() accordingly
    );
  }
}

class LanguageOption extends StatelessWidget {
  final Map<String, String> language;
  final bool isSelected;
  final Function(String) onSelect;

  const LanguageOption({
    Key? key,
    required this.language,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Card(
        color: isSelected ?Colors.blue[50]: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: isSelected ? Colors.blue : Color.fromARGB(255, 224, 224, 224),
            width: 1,
          ),
        ),
        child: ListTile(
          minLeadingWidth: 0,
          leading: CircleAvatar(
            backgroundImage: AssetImage(language['icon']!),
            backgroundColor: Colors.white,
          ),
          title: Text(language['name']!),
            trailing: Radio<bool>(
            value: isSelected,
            groupValue: true, // Since only one can be selected at a time
            onChanged: (bool? newValue) {
              if (newValue != null) {
              onSelect(language['name']!);
              }
            },
            activeColor: Colors.blue,
            fillColor: MaterialStateProperty.all<Color>(Colors.blue), // Set the default color of the radio button
            ),
          onTap: () {
            onSelect(language['name']!);
          },
        ),
      ),
    );
  }
}

final List<Map<String, String>> languages = [
  {'name': 'English', 'icon': 'assets/flags/english.png'},
  {'name': 'Arabic', 'icon': 'assets/flags/arabic.png'},
  {'name': 'Spanish', 'icon': 'assets/flags/spanish.png'},
  {'name': 'French', 'icon': 'assets/flags/french.png'},
  {'name': 'German', 'icon': 'assets/flags/german.png'},
  {'name': 'Hindi', 'icon': 'assets/flags/hindi.png'},
  {'name': 'Portuguese', 'icon': 'assets/flags/portugal.png'},
  {'name': 'Korean', 'icon': 'assets/flags/korean.png'},
];
