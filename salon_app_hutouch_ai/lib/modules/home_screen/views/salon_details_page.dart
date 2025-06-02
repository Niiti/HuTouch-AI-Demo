 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class SalonDetailsPage extends StatelessWidget {
  const SalonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.salonDetailsTitle),
      ),
      body: const Center(
        child: Text('Details about the salon.'),
      ),
    );
  }
}
 
