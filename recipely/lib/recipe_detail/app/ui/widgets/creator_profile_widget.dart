import 'package:flutter/material.dart';
import '../../../core/utils/responsive_util.dart';

class CreatorProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);
    final height = ResponsiveUtil.getHeight(context);

    return Row(
      children: [
        CircleAvatar(
          radius: height * 0.05,
          backgroundImage: AssetImage('assets/Profile.png'),
        ),
        SizedBox(width: width * 0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Natalia Luca',
              style: TextStyle(
                fontFamily: 'Sofia Pro',
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(10, 37, 51, 1),
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'I\'m the author and recipe developer.',
              style: TextStyle(
                fontFamily: 'Sofia Pro',
                fontSize: width * 0.035,
                color: Color.fromRGBO(72, 81, 94, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
