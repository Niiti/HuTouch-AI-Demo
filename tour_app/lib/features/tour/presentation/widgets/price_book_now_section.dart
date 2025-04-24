// Updated code by Hutouch
/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:my_project/l10n/app_localizations.dart';

class PriceBookNowSection extends StatelessWidget {
  final double screenHeight;
  const PriceBookNowSection({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Row(
      children: [
        Row(
          children: [
            Text(
              '\$250',
              style: TextStyle(
                fontSize: screenHeight * 0.02956,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
                color: Colors.white,
              ),
            ),
            SizedBox(width: screenHeight * 0.005),
            Text(
              '/day',
              style: TextStyle(
                fontSize: screenHeight * 0.01724,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
                color: const Color.fromRGBO(163, 171, 191, 1),
              ),
            )
          ],
        ),
        const Spacer(),
        Align( // Removed unnecessary Expanded widget
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(104, 109, 205, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenHeight * 0.012315),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015,
                horizontal: screenHeight * 0.02,
              ),
            ),
            onPressed: () {
              // Navigate to booking page
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localizations.bookNow,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02463,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: screenHeight * 0.03,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
/* SELECTED CODE END */