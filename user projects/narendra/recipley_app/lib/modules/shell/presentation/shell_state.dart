import 'package:freezed_annotation/freezed_annotation.dart';
part 'shell_state.freezed.dart';

@freezed
sealed class ShellState with _$ShellState {
  const factory ShellState({@Default(0) int index}) = _ShellState;
}
