// File: lib/screens/matches_screen.dart

import 'package:dating3/screens/add_screen.dart';
import 'package:dating3/screens/discovery_screen.dart';
import 'package:dating3/screens/home_screen.dart';
import 'package:dating3/widgets/matches_header.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/body_section.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_section.dart';
import '../widgets/footer_section.dart';

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int _selectedIndex = 3;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(92),
        child: HeaderMatches(),
      ),
      body: BodySection(),
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
