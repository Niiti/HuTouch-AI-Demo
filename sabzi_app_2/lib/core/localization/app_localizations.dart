import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    // Add other supported locales here.
  ];

  // Static string getters
  String get appTitle => 'Responsive UI';
  String get searchStore => 'Search Store';
  String get seeAll => 'See all';
  String get exclusiveOffer => 'Exclusive Offer';
  String get bestSelling => 'Best Selling';
  String get groceries => 'Groceries';
  String get shop => 'Shop';
  String get explore => 'Explore';
  String get cart => 'Cart';
  String get favourite => 'Favourite';
  String get account => 'Account';

  // Map-based dynamic strings
  final Map<String, String> _localizedStrings = {
    "cartTitle": "My Cart",
    "checkout": "Go to Checkout",
  };

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
