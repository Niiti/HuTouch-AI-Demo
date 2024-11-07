import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/settings_screen.dart';

class HeaderMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: 92,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: defaultPadding, top: 24, bottom: 24),
        child: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color.fromRGBO(34, 23, 42, 0.08),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.02),
                  offset: Offset(0, 3),
                  blurRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined, color: textColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        'Matches',
        style: headingTextStyle,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: defaultPadding, top: 24, bottom: 24),
          child: IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Color.fromRGBO(34, 23, 42, 0.08),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.02),
                    offset: Offset(0, 3),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Image.asset('assets/filter_icon.png', color: textColor),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
