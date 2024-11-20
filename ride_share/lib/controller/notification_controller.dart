import 'package:get/get.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  void fetchNotifications() {
    notifications.addAll([
      NotificationModel(
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae',
        time: '15 min ago.',
        icon: 'assets/images/Payment.png',
      ),
      NotificationModel(
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae',
        time: '25 min ago.',
        icon: 'assets/images/Payment.png',
      ),
      NotificationModel(
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae',
        time: '15 min ago.',
        icon: 'assets/images/Payment.png',
      ),
      NotificationModel(
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae',
        time: '25 min ago.',
        icon: 'assets/images/Payment.png',
      ),
    ]);
  }
}
