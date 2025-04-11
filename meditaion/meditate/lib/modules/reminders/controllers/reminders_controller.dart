import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class RemindersController extends GetxController {
  Rx<DateTime> selectedTime = DateTime.now().obs; // ✅ Changed to DateTime
  RxList<bool> selectedDays = List<bool>.generate(7, (index) => false).obs;
  void toggleDay(int index) {
    selectedDays[index] = !selectedDays[index];
    selectedDays.refresh(); // Make sure UI updates
  }

  void savePreferences() {
    // Save logic here (e.g., print or call a service)
    print(
      'Preferences saved: time = ${selectedTime.value}, days = $selectedDays',
    );
  }

  void skipPreferences() {
    // Skip logic here
    print('Preferences skipped.');
  }

  void selectTime(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder:
          (_) => Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: selectedTime.value,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {
                      selectedTime.value = newTime; // ✅ Correct assignment
                    },
                  ),
                ),
                CupertinoButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
    );
  }
}
