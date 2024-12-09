// lib/modules/dashboard/widgets/team_card.dart
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import 'hexagon_button.dart';

class TeamCard extends StatelessWidget {
  final String imagePath;
  final String teamName;

  const TeamCard({
    super.key,
    required this.imagePath,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.03,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: width * 0.05,
          ),
          SizedBox(width: width * 0.05),
          Expanded(
            child: Text(
              teamName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const HexagonButton(),
        ],
      ),
    );
  }
}
