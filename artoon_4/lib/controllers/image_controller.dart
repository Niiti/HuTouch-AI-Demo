import 'package:get/get.dart';
import '../models/image_model.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImages = <ImageModel>[].obs;
  final ImagePicker _picker = ImagePicker();

  void addImage(ImageModel image) {
    selectedImages.add(image);
  }

  void removeImage(ImageModel image) {
    selectedImages.remove(image);
  }

  Future<void> pickImageFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      addImage(ImageModel(path: photo.path));
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      addImage(ImageModel(path: photo.path));
    }
  }
}
