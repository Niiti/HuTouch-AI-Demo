import 'package:flutter/material.dart';

import '../widgets/featuring_today_section.dart';
import '../widgets/header_section.dart';
import '../widgets/navigation_tabs.dart';
import '../widgets/sections.dart';

class MusicHomePageBody extends StatefulWidget {
  @override
  _MusicHomePageBodyState createState() => _MusicHomePageBodyState();
}

class _MusicHomePageBodyState extends State<MusicHomePageBody> {
  int _selectedTabIndex = 0;

  void _onCategoryTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    // Implement category switching logic here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          NavigationTabs(
            selectedIndex: _selectedTabIndex,
            onTabTapped: _onCategoryTabTapped,
          ),
          FeaturingTodaySection(),
          RecentlyPlayedSection(),
          MixesForYouSection(),
          FromArtistsYouFollowSection(),
          NewReleasesSection(),
          TopPlaylistsSection(),
        ],
      ),
    );
  }
}