import 'package:flutter/material.dart';
import '../widgets/stats_bar_chart.dart';
import '../widgets/stats_team_button.dart';

class StatsBody extends StatelessWidget {
  const StatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _teamColumn("assets/images/team_chelsea_logo.png", "CHELSEA"),
                  const Text(
                    "FIFA Official Stats",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _teamColumn("assets/images/team_man_united_logo.png", "MAN UTD"),
                ],
              ),
              const SizedBox(height: 16),
              const StatsBarChart(
                title: "ATTACKING",
                chelseaStat: "47%",
                manUtdStat: "41%",
                contestStat: "13% in contest",
              ),
              const StatsBarChart(
                title: "GOAL",
                chelseaStat: "1",
                manUtdStat: "3",
                contestStat: "Inside the penalty area",
              ),
              const StatsBarChart(
                title: "ASSISTS",
                chelseaStat: "3",
                manUtdStat: "3",
                contestStat: "",
              ),
            ],
          ),
        ),

        // Bottom Buttons Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: const [
              StatsTeamButton(
                label: "CHELSEA",
                isActive: false,
              ),
              SizedBox(width: 8), // Added spacing between buttons
              StatsTeamButton(
                label: "MAN UTD",
                isActive: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Add spacing below buttons
      ],
    );
  }

  Widget _teamColumn(String logo, String teamName) {
    return Column(
      children: [
        Image.asset(logo, height: 40),
        const SizedBox(height: 4),
        Text(
          teamName,
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
