import 'package:flutter/material.dart';
import '../models/user_card_data.dart';

class UserProfileScreen extends StatelessWidget {
  final UserCardData userCardData;

  UserProfileScreen({required this.userCardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${userCardData.name}\'s Profile'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(userCardData.image),
              ),
            ),
            SizedBox(height: 24),
            Text(
              '${userCardData.name}, ${userCardData.age}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${userCardData.location}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Interests',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: userCardData.interests
                  .map((interest) => Chip(label: Text(interest)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
