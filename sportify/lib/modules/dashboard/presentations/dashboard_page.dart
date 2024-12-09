// lib/modules/dashboard/presentations/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/custom_footer.dart';
import '../widgets/custom_header.dart';
import '../widgets/team_card.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(),
            Expanded(
              child: Obx(() {
                if (controller.teams.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.teams.length,
                  itemBuilder: (context, index) {
                    final team = controller.teams[index];
                    return TeamCard(
                      imagePath: team.logoUrl,
                      teamName: team.name,
                    );
                  },
                );
              }),
            ),
            CustomFooter(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeIndex,
            ),
          ],
        ),
      ),
    );
  }
}
