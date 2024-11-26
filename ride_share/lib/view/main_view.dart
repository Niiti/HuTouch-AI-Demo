import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/controller/address_selection_controller.dart';
import 'package:ride_share/utils/app_constants.dart';
import 'package:ride_share/view/home_view.dart';
import 'package:ride_share/view/notification_view.dart';
import '../controller/main_controller.dart';
import '../utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'location_list_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final MainController controller = Get.put(MainController());
  final Completer<GoogleMapController> _mapController = Completer();

  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(21.145800, 79.088158), // Replace with your desired coordinates
    zoom: 10,
  );

  // Add this method to fetch current location and move the map
  Future<void> _goToCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request the user to enable them
      await Geolocator.openLocationSettings();
      return;
    }

    // Check location permission status
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle appropriately
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle appropriately
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Move the map camera to the current position
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16.0,
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map Widget
          Positioned.fill(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
        Positioned(
          top: 50,
          left: 20,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/icons/Hamburger Menu.png',
            color: AppColors.black),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: GestureDetector(
            onTap: () {
          Get.to(() => NotificationView());
          print('Notification icon tapped');
            },
            child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset('assets/icons/Notification.png',
              color: AppColors.black),
            ),
          ),
        ),
        Positioned(
          bottom: 210,
          left: 35,
          child: Container(
            width: 130,
            height: 48,
            decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
          child: Text(
            'Rental',
            style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500),
          ),
            ),
          ),
        ),
        Positioned(
          bottom: 220,
          right: 30,
          child: GestureDetector(
            onTap: () {
              // Add your onTap functionality here
              _goToCurrentLocation();
              print('Location target icon tapped');
            },
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey),
              ),
              child: Image.asset('assets/icons/Location tarhget.png',
            color: AppColors.grey),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 30,
          right: 30,
          child: Container(
            decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(
              color: AppColors.grey,
              width: 1), // Border for the container
            ),
            padding: EdgeInsets.all(16), // Padding inside the container
            child: Column(
          children: [
            GestureDetector(
              onTap: () {
            _showAddressSelectionSheet(context);
            print('Search bar tapped');
              },
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green, width: 1),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/search.png',
                color: AppColors.lightGrey),
                SizedBox(width: 10),
                Expanded(
              child: Text(
                'Where would you go?',
                style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 16,
                fontWeight: FontWeight.w500),
              ),
                ),
                Image.asset('assets/icons/heart.png',
                color: AppColors.lightestGrey),
              ],
            ),
              ),
            ),
            SizedBox(
            height: 20), // Spacing between the search bar and buttons
            // Buttons
            Row(
              children: [
            Expanded(
              child: Obx(
                () => GestureDetector(
              onTap: () {
                Get.to(() => HomeView());
                // controller.toggleOption('Transport');
              },
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: controller.selectedOption.value ==
                  'Transport'
                  ? AppColors.green
                  : Colors.white,
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                  ),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Center(
                  child: Text(
                'Transport',
                style: TextStyle(
                  color: controller.selectedOption.value ==
                      'Transport'
                  ? Colors.white
                  : AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                  ),
                ),
              ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => GestureDetector(
              onTap: () {
                controller.toggleOption('Delivery');
              },
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: controller.selectedOption.value ==
                  'Delivery'
                  ? AppColors.green
                  : Colors.white,
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Center(
                  child: Text(
                'Delivery',
                style: TextStyle(
                  color: controller.selectedOption.value ==
                      'Delivery'
                  ? Colors.white
                  : AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                  ),
                ),
              ),
                ),
              ),
            ),
              ],
            ),
          ],
            ),
          ),
        ),
          ],
        ),
      );
    }
    
  

  void _onIconTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        Get.to(() => MainView());
        break;
      case 1:
        // Navigate to dummy Favourite view
        Get.to(() => LocationListView());
        break;
      case 2:
        // Navigate to dummy Wallet view
        Get.to(() => DummyWalletView());
        break;
      case 3:
        // Navigate to dummy Offer view
        Get.to(() => DummyOfferView());
        break;
      case 4:
        // Navigate to dummy Profile view
        Get.to(() => DummyProfileView());
        break;
    }
  }
}

// Dummy classes for demonstration purposes
class DummyFavouriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Center(
        child: Text('Favourite Screen'),
      ),
    );
  }
}

class DummyWalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Text('Wallet Screen'),
      ),
    );
  }
}

class DummyOfferView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer'),
      ),
      body: Center(
        child: Text('Offer Screen'),
      ),
    );
  }
}

class DummyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

void _showAddressSelectionSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Stack(
        children: [
          // Black tint background
          Container(color: Colors.black.withOpacity(0.5)),
          addressSelectionView(context)
        ],
      );
    },
  );
}

Widget addressSelectionView(BuildContext context) {
  final AddressSelectionController controller =
      Get.put(AddressSelectionController());

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: EdgeInsets.all(AppConstants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
              SizedBox(height: 24),
              _buildTextField('From', 'assets/icons/Settings.png'),
              SizedBox(height: 16),
              _buildTextField('To', 'assets/icons/map.png'),
              SizedBox(height: 24),
              Text(
                'Recent places',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    controller: scrollController,
                    itemCount: controller.places.length,
                    itemBuilder: (context, index) {
                      final place = controller.places[index];
                      return _buildPlaceEntry(
                          place.name, place.address, place.distance);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildTextField(String label, String iconPath) {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray),
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            iconPath,
            width: AppConstants.iconSize,
            height: AppConstants.iconSize,
            color: AppColors.iconColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: AppColors.black),
        ),
      ],
    ),
  );
}

Widget _buildPlaceEntry(String name, String address, String distance) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Image.asset('assets/icons/map.png',
            width: AppConstants.iconSize,
            height: AppConstants.iconSize,
            color: AppColors.iconColor),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(color: AppColors.gray),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Text(
          distance,
          style: TextStyle(color: AppColors.gray),
        ),
      ],
    ),
  );
}
