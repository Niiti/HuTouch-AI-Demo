import 'package:flutter/material.dart';
import 'package:recipely/search_screen/features/search_feature/presentation/screens/search_screen.dart';
import 'package:recipely/user_screen/app/ui/pages/dashboard_main.dart';
import '../../core/constants/config.dart';
import '../screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  void _navigateTo(BuildContext context, Widget screen) {
    if (ModalRoute.of(context)?.settings.name != screen.runtimeType.toString()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, 
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(Assets.homeIcon,
                  width: MediaQuery.of(context).size.width * 0.08),
              onPressed: () => _navigateTo(context, HomeScreen()),
            ),
            IconButton(
              icon: Image.asset(Assets.searchIcon,
                  width: MediaQuery.of(context).size.width * 0.08),
              onPressed: () => _navigateTo(context, SearchScreen()),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.14),
            IconButton(
              icon: Image.asset(Assets.notificationIcon,
                  width: MediaQuery.of(context).size.width * 0.08),
              onPressed: () => _navigateTo(context, NotificationScreen()),
            ),
            IconButton(
              icon: Image.asset(Assets.profileIcon,
                  width: MediaQuery.of(context).size.width * 0.08),
              onPressed: () => _navigateTo(context, DashboardMain()),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}
