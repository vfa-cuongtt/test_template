import 'package:flutter/cupertino.dart';
import 'package:test_template/src/localization/app_localization.dart';
import 'package:test_template/src/localization/locale_support.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) => LocaleSupport.locales.contains(
        locale.languageCode,
      );

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
