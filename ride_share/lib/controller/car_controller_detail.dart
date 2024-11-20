import 'package:get/get.dart';

import '../model/car_model.dart';

class DCarController extends GetxController {
  var selectedCar = Car(
    name: 'Mustang Shelby GT',
    imagePath: 'assets/images/mustang_car.png',
    rating: 4.9,
    reviews: 531,
  ).obs;
}
