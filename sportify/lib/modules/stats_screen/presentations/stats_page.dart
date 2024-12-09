import 'package:flutter/material.dart';
import '../widgets/stats_header.dart';
import '../widgets/stats_tabbar.dart';
import '../widgets/stats_body.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Total number of tabs (Overview, Stats, Playing XI, Video)
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: const [
            StatsHeader(), // Match Header
            StatsTabBar(), // Tabs for navigation
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Overview Content")),
                  StatsBody(), // Stats content
                  Center(child: Text("Playing XI Content")),
                  Center(child: Text("Video Content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
