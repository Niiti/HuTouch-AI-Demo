// lib/features/welcome/presentation/screens/generated_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../domain/blocs/welcome_bloc.dart';
import '../../../welcome/domain/events/welcome_event.dart';
import '../../../welcome/domain/states/welcome_state.dart';
import '../widgets/status_bar.dart';
import '../widgets/main_image.dart';

// Import the coffee dashboard and dependencies
import 'package:coffee_app/features/coffee_shop/presentation/screens/coffee_dashboard_screen.dart';
import 'package:coffee_app/features/coffee_shop/domain/blocs/coffee_bloc.dart';
import 'package:coffee_app/features/coffee_shop/data/repositories/coffee_repository.dart';
import 'package:coffee_app/features/coffee_shop/data/datasources/coffee_remote_data_source.dart';

class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: SafeArea(
          child: BlocListener<WelcomeBloc, WelcomeState>(
            listener: (context, state) {
              if (state is WelcomeSuccess) {
                // Navigate to the CoffeeDashboardScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => CoffeeBloc(
                        CoffeeRepositoryImpl(
                          CoffeeRemoteDataSourceImpl(),
                        ),
                      ),
                      child: CoffeeDashboardScreen(),
                    ),
                  ),
                );
              }
            },
            child: Column(
              children: [
                StatusBar(),
                MainImage(),
                Expanded(
                  child: BlocBuilder<WelcomeBloc, WelcomeState>(
                    builder: (context, state) {
                      if (state is WelcomeLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is WelcomeError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: ThemeConstants.subHeadingStyle(16),
                          ),
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: Text(
                              'Fall in Love with Coffee in Blissful Delight!',
                              style: ThemeConstants.headingStyle(
                                MediaQuery.of(context).size.height * 0.040,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: Text(
                              'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                              style: ThemeConstants.subHeadingStyle(
                                MediaQuery.of(context).size.height * 0.017,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<WelcomeBloc>().add(GetStartedEvent());
                              },
                              style: ThemeConstants.elevatedButtonStyle(
                                MediaQuery.of(context).size.height,
                                MediaQuery.of(context).size.width,
                              ),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.020,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPalette.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
