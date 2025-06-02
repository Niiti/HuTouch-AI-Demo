 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class AllFeaturedSalonsPage extends StatelessWidget {
  const AllFeaturedSalonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allFeaturedSalonsTitle),
      ),
      body: const Center(
        child: Text('List of all featured salons.'),
      ),
    );
  }
}
 
