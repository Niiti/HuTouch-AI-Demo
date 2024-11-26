import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(ProviderScope(child: WyntraApp()));
  Stripe.publishableKey = 'pk_test_51Mf4fPSDm6w3ySR7V7RSV0kVZc0hBPYoAWymk9abrc58urkNpEJFo6ixUFjpGAqpcS9uxsP8Gc1weT7n6HMHo8Wd006S5ExTdk';
}

class WyntraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wyntra',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Inter',
      ),
      home: WyntraHomePage(),
    );
  }
}
