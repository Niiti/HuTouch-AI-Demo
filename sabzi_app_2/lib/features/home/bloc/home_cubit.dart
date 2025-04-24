import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final String selectedLocation;
  final int currentBannerIndex;

  const HomeState({
    required this.selectedLocation,
    required this.currentBannerIndex,
  });

  HomeState copyWith({
    String? selectedLocation,
    int? currentBannerIndex,
  }) {
    return HomeState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          selectedLocation: 'Dhaka, Banassre',
          currentBannerIndex: 0,
        ));

  final List<String> banners = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  List<String> get locations => ['Dhaka, Banassre', 'Chittagong', 'Sylhet'];

  void changeLocation(String? newLocation) {
    if (newLocation != null) {
      emit(state.copyWith(selectedLocation: newLocation));
    }
  }

  void nextBanner() {
    final nextIndex = (state.currentBannerIndex + 1) % banners.length;
    emit(state.copyWith(currentBannerIndex: nextIndex));
  }

  void previousBanner() {
    final previousIndex = (state.currentBannerIndex - 1 + banners.length) % banners.length;
    emit(state.copyWith(currentBannerIndex: previousIndex));
  }
}