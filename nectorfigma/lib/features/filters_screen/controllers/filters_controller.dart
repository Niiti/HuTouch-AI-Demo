import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/core/utils/utils.dart';
import 'package:nectorfigma/features/filters_screen/models/filter_option_model.dart';

class FiltersController extends GetxController {
  final categoryOptions =
      <FilterOptionModel>[
        FilterOptionModel(label: 'Eggs', assetPath: ImagesAsset.eggs),
        FilterOptionModel(label: 'Noodles & Pasta'),
        FilterOptionModel(label: 'Chips & Crisps'),
        FilterOptionModel(label: 'Fast Food'),
      ].obs;

  final brandOptions =
      <FilterOptionModel>[
        FilterOptionModel(label: 'Individual Collection'),
        FilterOptionModel(label: 'Cocola', assetPath: ImagesAsset.cocacola),
        FilterOptionModel(label: 'Ifad'),
        FilterOptionModel(label: 'Kazi Farmas'),
      ].obs;

  void applyFilters() {
    try {
      final selectedCategories =
          categoryOptions
              .where((o) => o.isSelected.value)
              .map((o) => o.label)
              .toList();
      final selectedBrands =
          brandOptions
              .where((o) => o.isSelected.value)
              .map((o) => o.label)
              .toList();
      print('Selected Categories: $selectedCategories');
      print('Selected Brands: $selectedBrands');
    } catch (e) {
      Utils.showErrorSnackBar('Failed to apply filters');
    }
  }
}
