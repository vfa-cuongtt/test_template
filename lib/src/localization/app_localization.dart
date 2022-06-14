import 'package:flutter/widgets.dart';
import 'package:test_template/src/localization/dart_files/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalization {
  const AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization? of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization);

  static Future<AppLocalization> load(Locale locale) async {
    final localeName = Intl.canonicalizedLocale(locale.languageCode);
    // It produces an error now but it's fine; it will
    // disappear as soon as we use code generation to
    // create internationalization utilities
    await initializeMessages(localeName);
    // Setup intl to work with the device's locale
    Intl.defaultLocale = localeName;
    return AppLocalization(locale);
  }

  /// Strings that need to be internationalized and/or
  /// localized are defined as getters returning the result of Intl.message,
  /// which is made up of two basic (required) parameters:
  // TODO(username): Define strings that need to be translated.
  String get settings => Intl.message(
        'settings',
        name: 'settings',
      );

  String get languages => Intl.message(
        'languages',
        name: 'languages',
      );

  String get back => Intl.message(
        'back',
        name: 'back',
      );

  String get themes => Intl.message('themes', name: 'themes');
}
