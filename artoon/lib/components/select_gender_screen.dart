import 'package:flutter/material.dart';
import 'go_premium_screen.dart';

class SelectGenderScreen extends StatefulWidget {
  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  String? selectedGender;

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _createAvatars() {
    if (selectedGender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GoPremiumScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a gender')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Gender"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "What's your gender?",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "We will only use this information to personalize your experience.",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () => _selectGender('Woman'),
              child: Card(
                color:
                    selectedGender == 'Woman' ? Colors.blue[100] : Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.female, size: 50),
                  title: Text("Woman", style: TextStyle(fontSize: 20)),
                  subtitle: Text("Try yourself in different looks"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () => _selectGender('Man'),
              child: Card(
                color:
                    selectedGender == 'Man' ? Colors.blue[100] : Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.male, size: 50),
                  title: Text("Man", style: TextStyle(fontSize: 20)),
                  subtitle: Text("Try yourself in different looks"),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _createAvatars,
              child: Text("Create your avatars"),
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
}
