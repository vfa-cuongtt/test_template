import 'package:flutter/material.dart';
import 'package:test_template/src/common/utilities/extensions/string_extension.dart';
import 'package:test_template/src/features/settings/presentation/list_setting_common/list_setting_common_controller.dart';
import 'package:test_template/src/features/settings/presentation/list_setting_template/list_setting_template_controller.dart';
import 'package:test_template/src/localization/app_localization.dart';
import 'package:test_template/src/routers/e_page.dart';

class SettingPage extends EPage {
  const SettingPage({
    required Map<String, dynamic> args,
  }) : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const SettingScreenController();
  }
}

class SettingScreenController extends StatelessWidget {
  const SettingScreenController({Key? key}) : super(key: key);

  void onBack() {}

  @override
  Widget build(BuildContext context) {
    return SettingScreenView(this);
  }
}

class SettingScreenView extends StatelessWidget {
  const SettingScreenView(
    this.state, {
    Key? key,
  }) : super(key: key);

  final SettingScreenController state;

  @override
  Widget build(BuildContext context) {
    final titleSetting =
        AppLocalization.of(context)?.settings.defaultTo('').toTitleCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(titleSetting!),
      ),
      body: Column(
        children: const <Widget>[
          ListSettingCommonController(),
          ListSettingTemplateController(),
        ],
      ),
    );
  }
}
