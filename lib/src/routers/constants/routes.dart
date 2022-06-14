import 'package:test_template/src/features/languages/presentation/pages/language_page.dart';
import 'package:test_template/src/features/not_found/presentation/not_found_screen.dart';
import 'package:test_template/src/features/settings/presentation/pages/setting_page.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/pages/ticket_challenge_page.dart';
import 'package:test_template/src/features/themes/presentation/pages/theme_page.dart';
import 'package:test_template/src/routers/constants/root_path.dart';
import 'package:test_template/src/routers/e_page.dart';
import 'package:test_template/src/routers/page_config.dart';

Map<String, EPage Function(Map<String, dynamic>)> _routes = {
  RootPath.settings: (args) => SettingPage(args: args),
  RootPath.settingLanguages: (args) => LanguagePage(args: args),
  RootPath.settingThemes: (args) => ThemePage(args: args),

  /// Define template ui/ux
  RootPath.templateTicketUI: (args) => TicketChallengePage(args: args),
};

EPage getEPage(PageConfig config) {
  final p = _routes[config.route]?.call(config.args) ??
      NotFoundScreen(args: config.args);
  return p;
}
