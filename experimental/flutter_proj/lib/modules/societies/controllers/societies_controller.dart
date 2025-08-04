import 'package:get/get.dart';
import 'package:my_project/core/constants/app_strings.dart';

import '../data/repositories/societies_repository.dart';
import '../models/society.dart';

class SocietiesController extends GetxController {
  final ISocietiesRepository societiesRepository;

  var societies = <Society>[].obs;
  var filteredSocieties = <Society>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;
  var searchTerm = ''.obs;

  SocietiesController(this.societiesRepository);

  @override
  void onInit() {
    super.onInit();
    // whenever searchTerm changes, apply filter
    ever(searchTerm, (_) => _applyFilter());
    fetchSocieties();
  }

  Future<void> fetchSocieties() async {
    try {
      isLoading(true);
      error('');
      final result = await societiesRepository.fetchSocieties();
      societies.assignAll(result);
      // initial filtered list
      filteredSocieties.assignAll(result);
    } catch (e) {
      error('Failed to load societies');
    } finally {
      isLoading(false);
    }
  }

  void onSearchChanged(String value) {
    searchTerm.value = value;
  }

  void _applyFilter() {
    final term = searchTerm.value.trim().toLowerCase();
    if (term.isEmpty) {
      filteredSocieties.assignAll(societies);
    } else {
      filteredSocieties.assignAll(
        societies.where((s) => s.name.toLowerCase().contains(term)).toList(),
      );
    }
  }
}
