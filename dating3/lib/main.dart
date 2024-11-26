import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'screens/messages_overview_screen.dart';

void main() {
  runApp(const ProviderScope(child: FriendzyApp()));
}

class FriendzyApp extends StatelessWidget {
  const FriendzyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendzy',
      theme: ThemeData(
        fontFamily: 'Hellix',
      ),
      home: MessagesOverviewScreen(),
    );
  }
}