// lib/widgets/header_section.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import 'circle_icon_button.dart';

class HeaderSection extends StatelessWidget {
  final String selectedLocation;
  final List<String> locations;
  final Function(String) onLocationSelected;

  HeaderSection({
    required this.selectedLocation,
    required this.locations,
    required this.onLocationSelected,
  });

  void showLocationSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(locations[index]),
              onTap: () {
                onLocationSelected(locations[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }

  void navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => showLocationSelector(context),
            child: Row(
              children: [
                Image.asset(
                  'assets/Location_pin.png',
                  width: 12,
                  height: 12,
                  color: kAccentColor,
                ),
                SizedBox(width: 8),
                Text(
                  selectedLocation,
                  style: TextStyle(
                    fontFamily: 'Hellix',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/dropdown_icon.png',
                  width: 12,
                  height: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
          Row(
            children: [
              CircleIconButton(
                iconAsset: 'assets/Search.png',
                onPressed: () => navigateToSearch(context),
              ),
              SizedBox(width: kDefaultPadding),
              CircleIconButton(
                iconAsset: 'assets/filter_icon.png',
                onPressed: () => navigateToSettings(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
