import 'package:flutter/material.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Notifications', style: TextStyle(fontSize: context.heightUnit * 2.4))),
      ),
    );
  }
}
