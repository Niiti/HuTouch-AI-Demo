// lib/features/welcome/domain/blocs/welcome_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/welcome_event.dart';
import '../states/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<GetStartedEvent>((event, emit) => emit(WelcomeSuccess()));
  }
}
