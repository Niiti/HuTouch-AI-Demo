import 'package:flutter/material.dart';
import 'ai_art_home_screen.dart'; // Import the AI Art Home Screen

class SelectGenderScreen extends StatefulWidget {
  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  String? selectedGender;

  void onGenderSelected(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void onSubmit() {
    if (selectedGender != null) {
      // Navigate to the new page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TrendingAvatarsScreen()), 
      );
    } else {
      // Notify the user that they need to select a gender first
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a gender to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Gender'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Male'),
            leading: Radio<String>(
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (String? value) {
                onGenderSelected(value!);
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio<String>(
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (String? value) {
                onGenderSelected(value!);
              },
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
