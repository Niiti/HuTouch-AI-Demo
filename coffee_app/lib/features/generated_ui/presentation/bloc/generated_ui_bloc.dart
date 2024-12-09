import 'package:bloc/bloc.dart';
import 'generated_ui_event.dart';
import 'generated_ui_state.dart';

class GeneratedUIBloc extends Bloc<GeneratedUIEvent, GeneratedUIState> {
  GeneratedUIBloc() : super(GeneratedUIInitial()) {
    on<NavigateToHomeEvent>((event, emit) {
      // Handle navigation event if needed
    });
  }
}