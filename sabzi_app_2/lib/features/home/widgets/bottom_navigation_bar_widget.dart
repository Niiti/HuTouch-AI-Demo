// Updated code by Hutouch
import 'package:flutter/material.dart';
import 'package:my_project/core/localization/app_localizations.dart';
import 'package:my_project/features/cart/screens/my_cart_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(84, 93, 88, 0.09),
            offset: Offset(2, -5),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Color.fromRGBO(230, 234, 243, 0.5),
            offset: Offset(0, -12),
            blurRadius: 37,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector( // Wrapped the Image with GestureDetector to add tap functionality
                  onTap: () {
                    print('Shop icon tapped'); // Added print statement for navigation simulation
                  },
                  child: Image.asset(
                    'assets/images/bottom_shop_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                GestureDetector( // Wrapped the Image with GestureDetector to add tap functionality
                  onTap: () {
                    print('Explore icon tapped'); // Added print statement for navigation simulation
                  },
                  child: Image.asset(
                    'assets/images/bottom_explore_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                GestureDetector( // Wrapped the Image with GestureDetector to add tap functionality
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCartScreen()),
                    );

                    print('Cart icon tapped'); // Added print statement for navigation simulation
                  },
                  child: Image.asset(
                    'assets/images/bottom_cart_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                GestureDetector( // Wrapped the Image with GestureDetector to add tap functionality
                  onTap: () {
                    print('Favourite icon tapped'); // Added print statement for navigation simulation
                  },
                  child: Image.asset(
                    'assets/images/bottom_favourite_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                GestureDetector( // Wrapped the Image with GestureDetector to add tap functionality
                  onTap: () {
                    print('Account icon tapped'); // Added print statement for navigation simulation
                  },
                  child: Image.asset(
                    'assets/images/bottom_shop_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  localizations.shop,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  localizations.explore,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  localizations.cart,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  localizations.favourite,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  localizations.account,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}