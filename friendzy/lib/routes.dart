import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/add_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/matches_overview_screen.dart';
import 'screens/likes_screen.dart';
import 'screens/connections_screen.dart';
import 'screens/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/home': (context) => HomeScreen(),
  '/profile': (context) => AddScreen(),
  '/add': (context) => AddScreen(),
  '/messages': (context) => MessagesScreen(),
  '/matches_overview': (context) => MatchesOverviewScreen(),
  '/likes': (context) => LikesScreen(),
  '/connections': (context) => ConnectionsScreen(),
  '/settings': (context) => SettingsScreen(),
};
