// lib/modules/dashboard/controllers/dashboard_controller.dart
import 'package:get/get.dart';

import '../services/team_service.dart';
import '../models/team.dart';

class DashboardController extends GetxController {
  var teams = <Team>[].obs;
  final TeamService _teamService = TeamService();

  @override
  void onInit() {
    super.onInit();
    _fetchTeams();
  }

  void _fetchTeams() async {
    try {
      var data = await _teamService.fetchTeams();
      teams.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load teams.');
    }
  }

  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
