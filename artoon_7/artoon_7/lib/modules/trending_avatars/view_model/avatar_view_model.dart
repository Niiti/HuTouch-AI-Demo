
import 'package:get/get.dart';
import '../model/avatar_model.dart';

class AvatarViewModel extends GetxController {
  var avatars = <Avatar>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAvatars();
  }

  void fetchAvatars() {
    // Fetch avatars logic
    avatars.addAll([
      Avatar(title: 'AUTUMN 3D', imageUrl: 'https://picsum.photos/id/58/300/200'),
      Avatar(title: 'AUTUMN 3D', imageUrl: 'https://picsum.photos/id/57/300/200'),
    ]);
  }

  void tryAvatar(Avatar avatar) {
    // Handle try avatar logic
    print("Trying ${avatar.title} avatar");
  }
}