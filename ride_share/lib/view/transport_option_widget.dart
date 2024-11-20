import 'package:flutter/material.dart';
import 'package:ride_share/utils/app_constants.dart';
import 'package:ride_share/utils/color_theme.dart';
import 'package:ride_share/view/car_list_view.dart';


class TransportOptionWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  TransportOptionWidget({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarListView()),
        );
        print('$title selected');
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorTheme.optionBackground,
          border: Border.all(
            color: ColorTheme.accent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: AppConstants.iconSize,
                height: AppConstants.iconSize,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorTheme.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
