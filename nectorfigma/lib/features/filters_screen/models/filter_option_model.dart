import 'package:get/get.dart';

class FilterOptionModel {
  final String label;
  final String? assetPath;
  final RxBool isSelected;

  FilterOptionModel({
    required this.label,
    this.assetPath,
    bool selected = false,
  }) : isSelected = selected.obs;
}
