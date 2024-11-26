import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ride_share/view/car_list_view.dart';
import 'package:ride_share/model/transport_option.dart';

class TransportController extends GetxController {
  // Mapping of class names to widget constructors
  final Map<String, Widget Function()> widgetMapping = {
    'CarListView': () => CarListView(),
    'BikeListView': () => BikeListView(),
    'CycleListView': () => CycleListView(),
    'TaxiListView': () => TaxiListView(),
  };

  // List of transport options
  final transportOptions = [
    TransportOption(
      title: 'Car',
      iconPath: 'assets/icons/Car.png',
      destination: 'CarListView',
    ),
    TransportOption(
      title: 'Bike',
      iconPath: 'assets/icons/Bike.png',
      destination: 'BikeListView',
    ),
    TransportOption(
      title: 'Cycle',
      iconPath: 'assets/icons/Cycle.png',
      destination: 'CycleListView',
    ),
    TransportOption(
      title: 'Taxi',
      iconPath: 'assets/icons/Taxi.png',
      destination: 'TaxiListView',
    ),
  ].obs;

  // Method to navigate to the corresponding destination
  void navigateToDestination(String destination, BuildContext context) {
    if (widgetMapping.containsKey(destination)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widgetMapping[destination]!()),
      );
    } else {
      Get.snackbar(
        'Error',
        'Destination "$destination" not found.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class BikeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike List View'),
      ),
      body: Center(
        child: Text('Bike List View'),
      ),
    );
  }
}

class CycleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cycle List View'),
      ),
      body: Center(
        child: Text('Cycle List View'),
      ),
    );
  }
}

class TaxiListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taxi List View'),
      ),
      body: Center(
        child: Text('Taxi List View'),
      ),
    );
  }
}
