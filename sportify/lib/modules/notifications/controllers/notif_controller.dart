import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var allowNotifications = true.obs;

  var leagueAlerts = <Map<String, dynamic>>[
    {
      'icon': 'assets/images/league_premium_league.png',
      'title': 'PREMIERE LEAGUE',
      'description': 'Breaking News, Editors Picks, Benefits & Rewards',
      'status': true.obs, // Observable status for ON/OFF
    },
    {
      'icon': 'assets/images/league_premium_league.png',
      'title': 'GAMES & STATS',
      'status': false.obs, // Observable status for ON/OFF
    },
  ].obs;

  var teamAlerts = <Map<String, dynamic>>[
    {
      'icon': 'assets/images/team_chelsea_logo.png',
      'title': 'CHELSEA',
      'status': true.obs, // Observable status for ON/OFF
    },
    {
      'icon': 'assets/images/team_leicester_city_logo.png',
      'title': 'LEICESTER CITY',
      'status': false.obs, // Observable status for ON/OFF
    },
    {
      'icon': 'assets/images/team_albion_logo.png',
      'title': 'ALBION',
      'status': false.obs, // Observable status for ON/OFF
    },
    {
      'icon': 'assets/images/team_arsenal_logo.png',
      'title': 'ARSENAL',
      'status': false.obs, // Observable status for ON/OFF
    },
    {
      'icon': 'assets/images/team_man_united_logo.png',
      'title': 'MAN UNITED',
      'status': false.obs, // Observable status for ON/OFF
    },
  ].obs;

  var selectedIndex = 0.obs;

  /// Update the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  /// Toggle the global allow notifications setting
  void toggleAllowNotifications(bool value) {
    allowNotifications.value = value;

    // If notifications are disabled, turn off all alerts
    if (!value) {
      leagueAlerts.forEach((alert) {
        alert['status'].value = false;
      });
      teamAlerts.forEach((alert) {
        alert['status'].value = false;
      });
    }
  }

  /// Toggle a specific league alert's status
  void toggleLeagueAlert(int index, bool value) {
    if (allowNotifications.value) {
      leagueAlerts[index]['status'].value = value;
    }
  }

  /// Toggle a specific team alert's status
  void toggleTeamAlert(int index, bool value) {
    if (allowNotifications.value) {
      teamAlerts[index]['status'].value = value;
    }
  }

  /// Get status text ("ON" or "OFF") for a specific league alert
  String getLeagueAlertStatus(int index) {
    return leagueAlerts[index]['status'].value ? 'ON' : 'OFF';
  }

  /// Get status text ("ON" or "OFF") for a specific team alert
  String getTeamAlertStatus(int index) {
    return teamAlerts[index]['status'].value ? 'ON' : 'OFF';
  }
}
