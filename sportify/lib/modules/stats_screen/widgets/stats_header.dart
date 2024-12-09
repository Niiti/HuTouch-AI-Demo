import 'package:flutter/material.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back, color: Colors.black),
              Text(
                "FINAL",
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 24), // Empty space for symmetry
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "20:00 · 18 Dec 2022",
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _teamColumn("assets/images/team_chelsea_logo.png", "CHELSEA"),
              Column(
                children: const [
                  Text(
                    "(4)  3 - 3  (2)",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Chelsea win 4-2 penalties",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              _teamColumn("assets/images/team_man_united_logo.png", "MAN UTD"),
            ],
          ),
        ],
      ),
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
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
