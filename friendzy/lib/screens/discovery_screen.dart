// lib/screens/discovery_screen.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/interest_chip_data.dart';
import '../models/user_card_data.dart';
import '../widgets/around_me_section.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/discover_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/header_section.dart';
import '../widgets/interest_section.dart';
import 'home_screen.dart';
import 'messages_screen.dart';
import 'add_screen.dart';
import 'matches_screen.dart';
import 'profile_screen.dart';

class DiscoveryScreen extends StatefulWidget {
  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  String selectedLocation = 'Germany';
  int _selectedIndex = 1;
  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> locations = ['Germany', 'France', 'Spain', 'Italy'];

  final List<InterestChipData> interests = [
    InterestChipData(label: '⚽️ Football', isSelected: false),
    InterestChipData(label: '🍃 Nature', isSelected: false),
    InterestChipData(label: '📷 Photography', isSelected: false),
    InterestChipData(label: '🎵 Music', isSelected: true),
    InterestChipData(label: '✍️ Writing', isSelected: false),
    InterestChipData(label: '🗣️ Language', isSelected: false),
    InterestChipData(label: '👕 Fashion', isSelected: false),
  ];

  final List<UserCardData> allUserCards = [
    UserCardData(
      image: 'assets/Halima.png',
      name: 'Halima',
      age: 19,
      location: 'BERLIN',
      distance: '16 km away',
      interests: ['🎵 Music', '📷 Photography'],
    ),
    UserCardData(
      image: 'assets/Vanessa.png',
      name: 'Vanessa',
      age: 18,
      location: 'MUNICH',
      distance: '4,8 km away',
      interests: ['⚽️ Football'],
    ),
    UserCardData(
      image: 'assets/james.png',
      name: 'James',
      age: 20,
      location: 'HANOVER',
      distance: '2,2 km away',
      interests: ['🍃 Nature', '🎵 Music'],
    ),
    UserCardData(
      image: 'assets/Selena.png',
      name: 'Kate',
      age: 21,
      location: 'KOLN',
      distance: '12,5 km away',
      interests: ['✍️ Writing'],
    ),
  ];

  List<UserCardData> filteredUserCards = [];

  @override
  void initState() {
    super.initState();
    filterUserCards();
  }

  void filterUserCards() {
    setState(() {
      List<String> selectedInterests = interests
          .where((interest) => interest.isSelected)
          .map((interest) => interest.label)
          .toList();
      if (selectedInterests.isEmpty) {
        filteredUserCards = allUserCards;
      } else {
        filteredUserCards = allUserCards.where((user) {
          return user.interests
              .any((interest) => selectedInterests.contains(interest));
        }).toList();
      }
    });
  }

  int currentIndex = 0;

  final List<Widget> screens = [
    DiscoveryScreen(),
    MessagesScreen(),
    AddScreen(),
    MatchesScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(
                selectedLocation: selectedLocation,
                locations: locations,
                onLocationSelected: (String value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
              SizedBox(height: kDefaultPadding),
              DiscoverSection(
                userCards: filteredUserCards,
              ),
              SizedBox(height: kDefaultPadding),
              InterestSection(
                interests: interests,
                onInterestSelected: (index) {
                  setState(() {
                    interests[index].isSelected = !interests[index].isSelected;
                    filterUserCards();
                  });
                },
              ),
              SizedBox(height: kDefaultPadding),
              AroundMeSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onBottomNavTapped,
        ),
      ),
    );
  }
}
