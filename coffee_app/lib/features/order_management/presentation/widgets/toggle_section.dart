import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class ToggleSection extends StatelessWidget {
  final bool isDeliver;
  final ValueChanged<bool> onToggle;

  const ToggleSection({Key? key, required this.isDeliver, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onToggle(true),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: isDeliver ? AppConstants.primaryColor : AppConstants.greyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.borderRadius),
                  bottomLeft: Radius.circular(AppConstants.borderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  'Deliver',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDeliver ? Colors.white : AppConstants.textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onToggle(false),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: !isDeliver ? AppConstants.primaryColor : AppConstants.greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppConstants.borderRadius),
                  bottomRight: Radius.circular(AppConstants.borderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  'Pick Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: !isDeliver ? Colors.white : AppConstants.textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
