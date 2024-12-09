// lib/features/welcome/domain/events/welcome_event.dart
import 'package:equatable/equatable.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class GetStartedEvent extends WelcomeEvent {}
