import 'package:flutter/material.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Profile', style: TextStyle(fontSize: context.heightUnit * 2.4))),
      ),
    );
  }
}
