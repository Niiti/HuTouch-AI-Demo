// import 'package:get/get.dart';
// import '../model/locationModel.dart';

// class LocationController extends GetxController {
//   var locations = <Location>[
//     Location(
//         title: 'Office',
//         address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
//         iconPath: 'assets/icons/Location Form.png'),
//     Location(
//         title: 'Home',
//         address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
//         iconPath: 'assets/icons/Location Form.png'),
//     Location(
//         title: 'House',
//         address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
//         iconPath: 'assets/icons/Location Form.png'),
//   ].obs;
// }

// location_controller.dart`
// This file handles fetching data from the API and stores it using GetX's reactive state management.

// ```dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/locationModel.dart';
import 'dart:convert';

class LocationController extends GetxController {
  var locations = <Location>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://9a0d3d9b-27ed-46b7-87b1-48ece87b0ea6.mock.pstmn.io/user/locations'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        locations.value = data['data']['locations'].map<Location>((location) => Location.fromJson(location)).toList();
        errorMessage.value = '';
      } else {
        errorMessage.value = 'Failed to load locations';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}