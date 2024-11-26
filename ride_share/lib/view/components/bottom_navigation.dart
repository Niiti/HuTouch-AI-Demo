import 'package:flutter/material.dart';
import 'package:ride_share/view/main_view.dart';
import '../../utils/app_colors.dart';
import '../location_list_view.dart';
import '../wallet_view.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/house.png', width: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/heart Fill.png', width: 24),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Image.asset('assets/icons/wallet fill.png', width: 24),
          ),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/discount.png', width: 24),
          label: 'Offer',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/user.png', width: 24),
          label: 'Profile',
        ),
      ],
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet')),
      body: Center(child: Text('Wallet Screen')),
    );
  }
}

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offer')),
      body: Center(child: Text('Offer Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Screen')),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainView(),
    LocationListView(),
    WalletView(),
    OfferScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/house.png', width: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/heart.png', width: 24),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Image.asset('assets/icons/wallet.png', width: 24),
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/discount.png', width: 24),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png', width: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
