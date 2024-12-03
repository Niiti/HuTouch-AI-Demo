import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import 'tabs/home_tab.dart';
import 'tabs/library_tab.dart';
import 'tabs/shorts_tab.dart';
import 'tabs/subscription_tab.dart';

class YoutubeHome extends StatelessWidget {
  final NavigationController _navigationController =
      Get.put(NavigationController());

  final List<Widget> _children = [
    HomeTab(),
    ShortsTab(),
    Placeholder(), // Placeholder for Add button
    SubscriptionTab(),
    LibraryTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _children[_navigationController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _navigationController.currentIndex.value,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white, // Set your desired background color here
            onTap: _navigationController.changeTabIndex,
            items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/logo/Property 1=ON-1.png',  width: 28), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/logo/Property 1=OFF-4.png', width: 28), label: 'Shorts'),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/logo/Property 1=OFF-3.png', width: 32), label: ''),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/logo/Property 1=OFF-2.png', width: 28), label: 'Subscription'),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/logo/Property 1=OFF.png',   width: 28), label: 'Library'),
              ],
          ),
        ));
  }
}
