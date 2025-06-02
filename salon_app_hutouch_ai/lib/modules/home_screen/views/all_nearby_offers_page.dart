 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class AllNearbyOffersPage extends StatelessWidget {
  const AllNearbyOffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allNearbyOffersTitle),
      ),
      body: const Center(
        child: Text('List of all nearby offers.'),
      ),
    );
  }
}
 
