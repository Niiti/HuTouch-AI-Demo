// lib/features/welcome/presentation/screens/generated_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../domain/blocs/welcome_bloc.dart';
import '../../domain/events/welcome_event.dart';
import '../../domain/states/welcome_state.dart';
import '../widgets/status_bar.dart';
import '../widgets/main_image.dart';

// Coffee feature
import '../../../coffee_shop/presentation/bloc/coffee_bloc.dart';
import '../../../coffee_shop/presentation/screens/coffee_dashboard_screen.dart';
import '../../../../core/di/injection_container.dart';

class GeneratedUI extends StatelessWidget {
  const GeneratedUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(),
      child: Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: SafeArea(
          child: BlocListener<WelcomeBloc, WelcomeState>(
            listener: (context, state) {
              if (state is WelcomeSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => sl<CoffeeBloc>()..add(LoadCoffeeProducts()),
                      child: const CoffeeDashboardScreen(),
                    ),
                  ),
                );
              }
            },
            child: Column(
              children: [
                const StatusBar(),
                const MainImage(),
                Expanded(
                  child: BlocBuilder<WelcomeBloc, WelcomeState>(
                    builder: (context, state) {
                      if (state is WelcomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WelcomeError) {
                        return Center(
                          child: Text(state.message,
                              style: ThemeConstants.subHeadingStyle(16)),
                        );
                      }
                      final size = MediaQuery.of(context).size;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: Text(
                              'Fall in Love with Coffee in Blissful Delight!',
                              style: ThemeConstants.headingStyle(size.height * 0.040),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: Text(
                              'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                              style: ThemeConstants.subHeadingStyle(size.height * 0.017),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<WelcomeBloc>().add(GetStartedEvent());
                              },
                              style: ThemeConstants.elevatedButtonStyle(size.height, size.width),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: size.height * 0.020,
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
