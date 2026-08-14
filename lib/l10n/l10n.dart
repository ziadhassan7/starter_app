import 'package:flutter/material.dart';
import '../main.dart';
import 'generated/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'), // English
    const Locale('ar'), // Arabic
  ];

  static final languageListName = [
    'English',
    'العربية',
  ];
}


class LocalizationService {
  LocalizationService._();

  static final LocalizationService instance = LocalizationService._();

  late AppLocalizations _localizations;

  void init(Locale locale) {
    _localizations = lookupAppLocalizations(locale);
    local.value = locale;

  }

  void setLocale(Locale locale) {
    _localizations = lookupAppLocalizations(locale);
    local.value = locale;

  }

  Locale get currentLocale => local.value;

  AppLocalizations get localizations => _localizations;
}

// We gonna use this variable for -localization without context-
AppLocalizations get localText =>
    LocalizationService.instance.localizations;

// You can also use => context.localText.text
extension LocalizationX on BuildContext {
  AppLocalizations get localText => AppLocalizations.of(this)!;
}