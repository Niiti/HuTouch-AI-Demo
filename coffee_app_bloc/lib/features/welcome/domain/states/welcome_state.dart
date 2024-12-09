// lib/features/welcome/domain/states/welcome_state.dart
import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeSuccess extends WelcomeState {}

class WelcomeError extends WelcomeState {
  final String message;

  const WelcomeError(this.message);

  @override
  List<Object> get props => [message];
}
