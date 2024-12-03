import 'package:flutter/material.dart';
import '../../core/constants/config.dart';
import '../../core/utils/responsive.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.sunIcon,
                  width: responsiveWidth(context, 0.05),
                ),
                SizedBox(width: responsiveWidth(context, 0.02)),
                Text(
                  'Good Morning',
                  style: TextStyleConstants.bodyStyle,
                ),
              ],
            ),
            SizedBox(height: responsiveWidth(context, 0.01)),
            Text(
              'Alena Sabyan',
              style: TextStyleConstants.headerStyle,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Image.asset(
                Assets.notificationIcon,
                width: responsiveWidth(context, 0.06),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                Assets.cartIcon,
                width: responsiveWidth(context, 0.06),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
