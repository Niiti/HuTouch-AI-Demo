import 'package:flutter/material.dart';
import 'package:my_project/l10n/app_localizations.dart';

class TopImageSection extends StatelessWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const TopImageSection({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenHeight * 0.02463),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                Image.asset(
                  'assets/images/nusa_pedina.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/best_tour_image_2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/b61fb97d8eee1a473326af18dd39df7c1a843a4f.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.42),
                      Colors.transparent,
                    ],
                    stops: [0.345, 0.932],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenHeight * 0.02,
                  vertical: screenHeight * 0.015,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.005),
                      
                      child: Image.asset(
                        'assets/images/back_button_icon.png',
                        height: screenHeight * 0.03,
                        // color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.005),
                      
                      child: Image.asset(
                        'assets/images/save_icon.png',
                        height: screenHeight * 0.03,
                        // color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        localizations.nusaPedina,
                        style: TextStyle(
                          fontSize: screenHeight * 0.02956,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'SF Pro Text',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/location_icon.png',
                          height: screenHeight * 0.01970,
                          color: Colors.white,
                        ),
                        SizedBox(width: screenHeight * 0.005),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            localizations.baliIndonesia,
                            style: TextStyle(
                              fontSize: screenHeight * 0.02217,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}