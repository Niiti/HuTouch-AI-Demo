 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class NavBarItem extends StatelessWidget {
  final String assetPath;
  final String label;

  const NavBarItem({
    super.key,
    required this.assetPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            assetPath,
            color: const Color.fromRGBO(21, 103, 120, 1),
            width: height * 0.03,
          ),
          SizedBox(height: height * 0.005),
          Text(
            label,
            style: TextStyle(
              fontFamily: Fonts.nunitoSans,
              fontSize: height * 0.015,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
 
