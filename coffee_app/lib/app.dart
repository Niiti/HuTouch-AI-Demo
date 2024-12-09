import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/network/network_info.dart';
import 'features/coffee_catalog/data/datasources/coffee_remote_data_source.dart';
import 'features/coffee_catalog/data/repositories/coffee_repository_impl.dart';
import 'features/coffee_catalog/domain/usecases/get_coffees.dart';
import 'features/coffee_catalog/presentation/bloc/coffee_bloc.dart';
import 'features/generated_ui/presentation/bloc/generated_ui_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/coffee_catalog/presentation/pages/coffee_page.dart';
import './features/generated_ui/presentation/pages/generated_ui_page.dart';
import './features/home/presentation/pages/home_page.dart';

import 'core/constants/app_constants.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => GeneratedUIPage(),
      ),
      GoRoute(
        path: AppConstants.homeRoute,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/coffee_catalogue',
        builder: (context, state) => CoffeePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneratedUIBloc>(
          create: (context) => GeneratedUIBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        // Add CoffeeBloc here. Make sure you have set up GetCoffees and CoffeeRepositoryImpl properly.
        BlocProvider<CoffeeBloc>(
          create: (context) {
            // Create your CoffeeBloc with its dependencies
            final networkInfo = NetworkInfo();
            final coffeeRepository = CoffeeRepositoryImpl(
              networkInfo: networkInfo,
            );
            return CoffeeBloc(getCoffees: GetCoffees(coffeeRepository))
              ..add(LoadCoffeesEvent());
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Coffee App',
        theme: ThemeData(
          primaryColor: Color(0xFFD2691E),
          fontFamily: 'Sora',
        ),
        routerConfig: _router,
      ),
    );
  }
}
