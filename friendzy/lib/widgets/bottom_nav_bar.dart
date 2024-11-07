import 'package:dating3/screens/messages_screen.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/add_screen.dart';
import '../screens/discovery_screen.dart';
import '../screens/home_screen.dart';
import '../screens/matches_screen.dart';
import '../screens/profile_screen.dart';
import 'nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  void _navigateToScreen(BuildContext context, int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = HomeScreen();
        break;
      case 1:
        screen = DiscoveryScreen();
        break;
      case 2:
        screen = AddScreen();
        break;
      case 3:
        screen = MatchesScreen();
        break;
      case 4:
        screen = MessagesScreen();
        break;
      default:
        screen = HomeScreen();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(117, 34, 119, 0.15),
            offset: Offset(8, 0),
            blurRadius: 40,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavBarItem(
            index: 0,
            iconPath: 'assets/home.png',
            isSelected: selectedIndex == 0,
            onTap: (index) {
              _navigateToScreen(context, index);
              onItemTapped(index);
            },
          ),
          NavBarItem(
            index: 1,
            iconPath: 'assets/compass_icon.png',
            isSelected: selectedIndex == 1,
            onTap: (index) {
              _navigateToScreen(context, index);
              onItemTapped(index);
            },
          ),
          NavBarItem(
            index: 2,
            iconPath: 'assets/add_icon.png',
            isSelected: selectedIndex == 2,
            onTap: (index) {
              _navigateToScreen(context, index);
              onItemTapped(index);
            },
          ),
          NavBarItem(
            index: 3,
            iconPath: 'assets/people.png',
            isSelected: selectedIndex == 3,
            onTap: (index) {
              _navigateToScreen(context, index);
              onItemTapped(index);
            },
          ),
          NavBarItem(
            index: 4,
            iconPath: 'assets/comment_transparent_icon.png',
            isSelected: selectedIndex == 4,
            isProfile: true,
            onTap: (index) {
              _navigateToScreen(context, index);
              onItemTapped(index);
            },
          ),
        ],
      ),
    );
  }
}

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Comments Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
