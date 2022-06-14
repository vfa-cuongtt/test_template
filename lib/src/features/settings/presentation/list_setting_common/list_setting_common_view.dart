import 'package:flutter/cupertino.dart';
import 'package:test_template/src/features/core/presentation/widget_functional_controller.dart';
import 'package:test_template/src/features/settings/domain/entities/setting_entity.dart';
import 'package:test_template/src/features/settings/presentation/list_setting/list_settings.dart';
import 'package:test_template/src/features/settings/presentation/list_setting_common/list_setting_common_controller.dart';
import 'package:test_template/src/features/settings/presentation/widgets/molecules/group_list_settings.dart';

class ListSettingCommonView
    extends WidgetFunctionalController<ListSettingCommonController> {
  const ListSettingCommonView(
    ListSettingCommonController state, {
    Key? key,
    required this.settings,
  }) : super(state, key: key);

  final List<SettingEntity> settings;

  @override
  Widget build(BuildContext context) {
    return GroupListSettings(
      title: 'Commons',
      child: ListSettings(
        settings: settings,
        onPressed: state.onPress,
      ),
    );
  }
}
