import 'package:flutter/material.dart';
import 'package:my_project/l10n/app_localizations.dart';

class TravelSummaryHeader extends StatelessWidget {
  final double screenHeight;
  const TravelSummaryHeader({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localizations.travelSummary,
          style: TextStyle(
            fontSize: screenHeight * 0.02463,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Text',
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to more details
          },
          child: Row(
            children: [
              Text(
                localizations.seeMore,
                style: TextStyle(
                  fontSize: screenHeight * 0.01478,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'SF Pro Text',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: screenHeight * 0.005),
              Container(
                padding: EdgeInsets.all(screenHeight * 0.005),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/next_button.png',
                  height: screenHeight * 0.01528,
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}