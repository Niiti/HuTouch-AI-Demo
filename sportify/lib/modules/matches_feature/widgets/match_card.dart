import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String leagueLogo;
  final String homeTeam;
  final String homeTeamLogo;
  final String awayTeam;
  final String awayTeamLogo;
  final String time;
  final VoidCallback onTap; // Callback for press action

  const MatchCard({
    Key? key,
    required this.leagueLogo,
    required this.homeTeam,
    required this.homeTeamLogo,
    required this.awayTeam,
    required this.awayTeamLogo,
    required this.time,
    required this.onTap, // Ensure onTap is passed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Handle press action
      borderRadius:
          BorderRadius.circular(8), // For ripple effect within rounded edges
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(leagueLogo, height: 20),
                Text(
                  time,
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _teamColumn(homeTeamLogo, homeTeam),
                _teamColumn(awayTeamLogo, awayTeam),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PLAYOFFS - ROUND 1",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Best of 3",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamColumn(String logo, String name) {
    return Column(
      children: [
        Image.asset(logo, height: 40),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
