import 'package:get/get.dart';
import '../model/place_model.dart';

class AddressSelectionController extends GetxController {
  var places = <Place>[
    Place(
      name: 'Office',
      address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
      distance: '2.7km',
    ),
    Place(
      name: 'Coffee shop',
      address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
      distance: '1.1km',
    ),
    Place(
      name: 'Shopping center',
      address: '4140 Parker Rd. Allentown, New Mexico 31134',
      distance: '4.9km',
    ),
    Place(
      name: 'Shopping mall',
      address: '4140 Parker Rd. Allentown, New Mexico 31134',
      distance: '4.0km',
    ),
  ].obs;
}
