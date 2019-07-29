import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class I18n {
  // CORE
  static String appTitle(BuildContext context) => _text("app_title", context);

  static String networkErrorTitle(BuildContext context) => _text("network_error_title", context);

  static String retry(BuildContext context) => _text("retry", context);

  static String emailHint(BuildContext context) => _text("email_hint", context);

  static String passwordHint(BuildContext context) => _text("password_hint", context);

  static String _text(String key, BuildContext context) => Localizations.of<I18n>(context, I18n).text(key);

  I18n(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<String, dynamic> _localizedValues;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  List<String> array(String key) {
    final List<String> array = [];
    _localizedValues[key].forEach((value) {
      array.add(value as String ?? '** $key not found');
    });
    return array;
  }

  static Future<I18n> load(Locale locale) async {
    I18n translations = new I18n(locale);
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<I18n> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
