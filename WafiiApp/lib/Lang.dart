import 'package:flutter/material.dart';

void main() {
  runApp(LangPage());
}

class LangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyMedium:
              TextStyle(fontSize: 14, color: Colors.black), // Updated key
        ),
      ),
      home: GeneratedUI(),
    );
  }
}

class GeneratedUI extends StatefulWidget {
  @override
  _GeneratedUIState createState() => _GeneratedUIState();
}

class _GeneratedUIState extends State<GeneratedUI> {
  String _selectedCountry = 'Bahrain';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final textScale = mediaQuery.textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              Column(
                children: [
                  Container(
                    height: height * 0.07,
                    child: Image.asset('assets/logo2.png'),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 18 * textScale,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(205, 17, 38, 1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Text(
                  'Hello, Let’s search for your\nfavourite store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17 * textScale,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LanguageButton(
                      label: 'English',
                      selected: true,
                      onPressed: () {},
                    ),
                    LanguageButton(
                      label: 'عربي',
                      selected: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              CountrySelector(
                selectedCountry: _selectedCountry,
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value!;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.bottomCenter,
                child: ContinueButton(onPressed: () {}),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  LanguageButton(
      {required this.label, required this.selected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: selected
            ? Color.fromRGBO(205, 17, 38, 1)
            : Color.fromRGBO(232, 232, 232, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class CountrySelector extends StatelessWidget {
  final String selectedCountry;
  final ValueChanged<String?> onChanged;

  CountrySelector({required this.selectedCountry, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Select Country',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: height * 0.015),
        Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedCountry,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.01),
              border: InputBorder.none,
            ),
            items: <String>[
              'Bahrain',
              'Saudi Arabia',
              'United Arab Emirates',
              'Kuwait',
              'Qatar'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(205, 17, 38, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 2,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.1, vertical: height * 0.02),
        ),
        child: Text(
          'Continue',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
