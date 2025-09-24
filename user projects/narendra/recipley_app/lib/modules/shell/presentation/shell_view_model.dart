import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/modules/shell/presentation/shell_state.dart';

class ShellViewModel extends Notifier<ShellState> {
  @override
  ShellState build() => const ShellState();

  void changeTab(int i) => state = state.copyWith(index: i);
}

final shellProvider = NotifierProvider<ShellViewModel, ShellState>(ShellViewModel.new);
