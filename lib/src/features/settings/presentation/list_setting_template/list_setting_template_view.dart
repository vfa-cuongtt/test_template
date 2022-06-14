import 'package:flutter/cupertino.dart';
import 'package:test_template/src/features/core/presentation/widget_functional_controller.dart';
import 'package:test_template/src/features/settings/domain/entities/setting_entity.dart';
import 'package:test_template/src/features/settings/presentation/list_setting/list_settings.dart';
import 'package:test_template/src/features/settings/presentation/list_setting_template/list_setting_template_controller.dart';
import 'package:test_template/src/features/settings/presentation/widgets/molecules/group_list_settings.dart';

class ListSettingTemplateView
    extends WidgetFunctionalController<ListSettingTemplateController> {
  const ListSettingTemplateView(
    ListSettingTemplateController state, {
    Key? key,
    required this.settings,
  }) : super(state, key: key);

  final List<SettingEntity> settings;
  @override
  Widget build(BuildContext context) {
    return GroupListSettings(
      title: 'Template UI/UX',
      child: ListSettings(
        settings: settings,
        onPressed: state.onPress,
      ),
    );
  }
}
