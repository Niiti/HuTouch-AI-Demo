import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en'),
    // Add other supported locales here.
  ];

  // Strings from both files
  String get welcomeBack => 'Welcome back';
  String get userName => 'Kshitij Gavhane';
  String get search => 'Search';
  String get theBestTours => 'The best tours';
  String get suggestionsForYou => 'Suggestions for you';
  String get seeAll => 'See all';
  String get duration => 'Duration';
  String get distance => 'Distance';
  String get rating => 'Rating';
  String get descriptionTitle => 'Description';
  String get descriptionContent =>
      'if you wish to experience breezy. beaches, swaying palm trees, and quirky beach shacks, make your way to Bali. Our Bali tour is dotted with volcanic mountains, iconic rice paddies, and vibrant nightlife. Now that you have booked your experiential tour package.';
  String get travelSummary => 'Travel summary';
  String get seeMore => 'See more';
  String get bookNow => 'Book Now';
  String get nusaPedina => 'Nusa Pedina';
  String get baliIndonesia => 'Bali, Indonesia';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
