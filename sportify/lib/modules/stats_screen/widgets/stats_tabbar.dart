import 'package:flutter/material.dart';

class StatsTabBar extends StatelessWidget {
  const StatsTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      labelColor: Colors.red,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.red,
      labelStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Tab(text: "Overview"),
        Tab(text: "Stats"),
        Tab(text: "Playing XI"),
        Tab(text: "Video"),
      ],
    );
  }
}
