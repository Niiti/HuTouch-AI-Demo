import 'package:flutter/material.dart';

class StatsBarChart extends StatelessWidget {
  final String title;
  final String chelseaStat;
  final String manUtdStat;
  final String contestStat;

  const StatsBarChart({
    Key? key,
    required this.title,
    required this.chelseaStat,
    required this.manUtdStat,
    required this.contestStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: int.parse(chelseaStat.replaceAll('%', '')),
              child: Container(
                height: 6,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: int.parse(manUtdStat.replaceAll('%', '')),
              child: Container(
                height: 6,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          contestStat,
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
