import 'package:get/get.dart';
import 'package:ride_share/model/car_model.dart';
import 'package:ride_share/view/car_details_view.dart';

class CarController extends GetxController {
  var cars = <Car>[
    Car(
        name: 'BMW Cabrio',
        imagePath: 'assets/images/mustang_car.png',
        details: 'Automatic | 3 seats | Octane',
        distance: '800m (5mins away)'),
    Car(
        name: 'Mustang Shelby GT',
        imagePath: 'assets/images/mustang_car.png',
        details: 'Automatic | 3 seats | Octane',
        distance: '800m (5mins away)'),
    Car(
        name: 'BMW 18',
        imagePath: 'assets/images/mustang_car.png',
        details: 'Automatic | 3 seats | Octane',
        distance: '800m (5mins away)'),
    Car(
        name: 'Jaguar Silber',
        imagePath: 'assets/images/mustang_car.png',
        details: 'Automatic | 3 seats | Octane',
        distance: '800m (5mins away)')
  ].obs;

  void viewCarDetails(String carName) {
    // Get.to(CarDetailsView(carName: carName));
    Get.to(() => CarDetailsView(carName: carName));
    Get.snackbar('Car Details', 'Viewing details for $carName');
  }
}
