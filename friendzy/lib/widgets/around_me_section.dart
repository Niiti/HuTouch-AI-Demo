// lib/widgets/around_me_section.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class AroundMeSection extends StatelessWidget {
  void connectWithClara(BuildContext context) {
    // Implement connect functionality
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'Around me',
            style: TextStyle(
              fontFamily: 'Hellix',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
              height: 1.2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'People with “Music” interest around you',
            style: TextStyle(
              fontFamily: 'Hellix',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kAccentColor,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          width: 343,
          height: 440,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/Maps.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 132,
                left: (343 - 93) / 2,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => connectWithClara(context),
                      child: Container(
                        width: 93,
                        height: 93,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/User_avatar.png'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4D4B164C),
                              blurRadius: 50,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Connect with Clara ?',
                      style: TextStyle(
                        fontFamily: 'Hellix',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: kBackgroundColor,
                        height: 1.33,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 288,
                top: 266,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/Fabian.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4D4B164C),
                        blurRadius: 50,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 143.5,
                bottom: 26,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement connectivity functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                    elevation: 10,
                    shadowColor: Color(0x4D4B164C),
                  ),
                  child: Icon(
                    Icons.wifi,
                    color: kTextColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
