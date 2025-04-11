import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeSelectionCard extends StatelessWidget {
  final DateTime selectedTime;
  final ValueChanged<DateTime> onTimeChanged;
  final double screenWidth;

  const TimeSelectionCard({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 200, // Minimum height for the picker to render correctly
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        initialDateTime: selectedTime,
        use24hFormat: false,
        onDateTimeChanged: onTimeChanged,
      ),
    );
  }
}
