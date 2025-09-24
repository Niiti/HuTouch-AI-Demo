// lib/main.dart
import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'core/di/injection_container.dart';
import 'features/welcome/presentation/screens/generated_ui.dart';
import 'features/coffee_shop/presentation/bloc/coffee_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(create: (_) => sl<CoffeeBloc>()..add(LoadCoffeeProducts())),
      ],
      child: MaterialApp(
        title: 'MyApp',
        theme: AppTheme.themeData,
        home: const GeneratedUI(),
      ),
    );
  }
}
