import 'package:flutter/material.dart';
import 'ai_art_home_screen.dart'; // Import the AI Art Home Screen
import 'ad_banner.dart';

class SelectGenderScreen extends StatefulWidget {
  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  String? _selectedGender;

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _onSubmit() {
    if (_selectedGender != null) {
      // Navigate to the AI Art Home Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AIArtHomeScreen()),
      );
    } else {
      // Notify the user to select a gender
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a gender to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("What's your gender?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We will only use this information to personalize your experience.',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            GenderOption(
              icon: Icons.female,
              gender: 'Woman',
              description: 'Try yourself in different looks',
              isSelected: _selectedGender == 'Woman',
              onTap: () => _onGenderSelected('Woman'),
            ),
            GenderOption(
              icon: Icons.male,
              gender: 'Man',
              description: 'Try yourself in different looks',
              isSelected: _selectedGender == 'Man',
              onTap: () => _onGenderSelected('Man'),
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSubmit,
                child: Text(
                  'Create your avatars',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            AdBanner(),
          ],
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final IconData icon;
  final String gender;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  GenderOption({
    required this.icon,
    required this.gender,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:
          isSelected ? 3 : 0, // Adjust elevation to create or reduce shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected
              ? Colors.blue
              : Colors.grey
                  .shade300, // Make border visible but subtle when not selected
          width: 2,
        ),
      ),
      color: Colors.white, 
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 16), // Padding inside the card
        height: 100,
        child: ListTile(
          onTap: onTap,
          leading: Container(
            padding: EdgeInsets.all(3), // Slight padding around the circle
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Background color of the outer circle
              border: Border.all(
                color: isSelected
                    ? Colors.blue
                    : Colors.grey.shade400, // Border color based on selection
                width: 2,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white, // Inner circle background color
              radius: 28, // Size of the inner circle
              child: Icon(
                icon,
                size: 28, // Adjust icon size as needed
                color: Colors.grey.shade600, // Icon color
              ),
            ),
          ),
          title: Text(
            gender,
            style: TextStyle(
              fontSize: 20, // Adjust font size for the title
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 13, // Adjust font size for the subtitle
              color: Colors.grey.shade600, // Subtitle color
            ),
          ),
        ),
      ),
    );
  }
}
