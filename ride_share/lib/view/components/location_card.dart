import 'package:flutter/material.dart';
import '../../model/locationModel.dart';
import '../../utils/app_constants.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  final Function(Location)? onRemove;

  LocationCard({required this.location, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.white, // Add your desired background color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xFFB2DFDB)),
        ),
        child: ListTile(
          leading: Image.asset(location.iconPath, width: 24),
          title: Text(
            location.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          subtitle: Text(
            location.address,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: GestureDetector(
            onTap: () {
              // TODO: Add functionality to remove location
                // Assuming you have a method to remove the location from the list
                // You might need to pass a callback function to this widget to handle the removal
                if (onRemove != null) {
                onRemove!(location);
                }
            },
            child: Image.asset(AppConstants.deleteIcon, width: 24, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
