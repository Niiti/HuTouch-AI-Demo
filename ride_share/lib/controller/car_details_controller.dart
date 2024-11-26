import 'package:get/get.dart';

import '../view/rentRequestView.dart';

class CarDetailsController extends GetxController {
  // Example reactive variables
  RxInt carImageIndex = 0.obs;
  final carImages = ['assets/images/mustang_car.png'];

  void nextImage() {
    carImageIndex.value = (carImageIndex.value + 1) % carImages.length;
  }

  void previousImage() {
    carImageIndex.value =
        (carImageIndex.value - 1 + carImages.length) % carImages.length;
  }

  void bookLater() {
    // Handling schedule booking
    print('Book later');
  }

  void rideNow() {
    // Get.to(CarDetailView());
    Get.to(() => RentRequestView());

    // Handling immediate booking
    print('Ride Now');
  }
}
