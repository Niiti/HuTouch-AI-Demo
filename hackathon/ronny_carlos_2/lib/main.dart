import 'package:flutter/material.dart';
import 'package:hackaton_end/app.dart';

import 'initSupabase.dart';

void main() async  {
  /// Flutter: 3.29.2

  WidgetsFlutterBinding.ensureInitialized();
  await DbSupaBase().init();
  runApp(const HackatonEndApp());
}
