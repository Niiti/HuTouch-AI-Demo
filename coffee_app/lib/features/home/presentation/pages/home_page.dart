import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomeEvent());

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Home'),
              backgroundColor: Color(0xFFD2691E),
            ),
            body: Center(
              child: Text(
                'Welcome to the Home Screen!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.brown[800],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Color(0xFFD2691E),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}