import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/rentRequestController.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import 'components/backButton.dart';
import 'components/locationTile.dart';
import 'components/carCard.dart';
import 'components/paymentCard.dart';

class RentRequestView extends StatelessWidget {
  final RentRequestController controller = Get.put(RentRequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(),
              SizedBox(height: 24),
              LocationTile(
                icon: AppConstants.logo,
                color: Colors.red,
                title: 'Current location',
                address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
                distance: '',
              ),
              SizedBox(height: 16),
              LocationTile(
                icon: AppConstants.logo,
                color: Colors.green,
                title: 'Office',
                address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                distance: '1.1km',
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              CarCard(),
              SizedBox(height: 16),
              buildDateAndTimeInput(context, controller),
              SizedBox(height: 24),
              Text(
                'Select payment method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              PaymentCard(
                title: '**** **** **** 8970',
                details: 'Expires: 12/26',
                icon: AppConstants.visaCard,
                active: true,
              ),
              PaymentCard(
                title: '**** **** **** 8970',
                details: 'Expires: 12/26',
                icon: AppConstants.masterCard,
                active: false,
              ),
              PaymentCard(
                title: 'mailaddress@mail.com',
                details: 'Expires: 12/26',
                icon: AppConstants.payPal,
                active: false,
              ),
              PaymentCard(
                title: 'Cash',
                details: '',
                icon: 'assets/icons/Back.png',
                active: false,
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _confirmBooking();
                    print("Booking Confirmed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Confirm Booking',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildDateAndTimeInput(
      BuildContext context, RentRequestController controller) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Date',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          onChanged: controller.updateDate,
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Time',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          onChanged: controller.updateTime,
        ),
      ],
    );
  }
}

Future<void> _selectDate(
    BuildContext context, RentRequestController controller) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != controller.selectedDate) {
    controller.updateDate(picked.toString());
  }
}

Future<void> _selectTime(
    BuildContext context, RentRequestController controller) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null && picked != controller.selectedTime) {
    controller.updateTime(picked.format(context));
  }
}

void _confirmBooking() {
  // Example logic for booking confirmation
  Get.snackbar(
    "Booking Confirmed",
    "Your booking has been successfully confirmed!",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}
