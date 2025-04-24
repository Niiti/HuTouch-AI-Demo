import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String selectedLocation;
  final List<String> locations;
  final ValueChanged<String?> onLocationChanged;

  const AppHeader({
    super.key,
    required this.selectedLocation,
    required this.locations,
    required this.onLocationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/app_logo_color.png',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        DropdownButton<String>(
          value: selectedLocation,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onLocationChanged,
          items: locations.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/location_marker_icon.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}