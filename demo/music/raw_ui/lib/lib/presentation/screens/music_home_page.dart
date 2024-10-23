import 'package:flutter/material.dart';
import 'library_screen.dart';
import 'music_home_page_body.dart';
import 'search_page.dart';
// import 'library_page.dart'; // Add a new page for "Your Library"

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Home Page',
      home: MusicHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicHomePage extends StatefulWidget {
  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  int _selectedNavIndex = 0;

  // List of pages that correspond to each bottom navigation bar item
  final List<Widget> _pages = [
    MusicHomePageBody(), // Home Page
    SearchPage(),        // Search Page (You'll need to create this page)
    LibraryScreen(),       // Your Library Page (You'll need to create this page)
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white.withOpacity(0.75),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _selectedNavIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Your Library',
          ),
        ],
      ),
      // Display the corresponding page for the selected index
      body: _pages[_selectedNavIndex],
    );
  }
}