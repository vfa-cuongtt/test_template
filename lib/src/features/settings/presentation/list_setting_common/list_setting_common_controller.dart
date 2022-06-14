import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/features/settings/constants/settings.dart';
import 'package:test_template/src/features/settings/presentation/list_setting_common/list_setting_common_view.dart';
import 'package:test_template/src/routers/bloc/navigation_cubit.dart';
import 'package:test_template/src/routers/constants/root_path.dart';

class ListSettingCommonController extends StatelessWidget {
  const ListSettingCommonController({Key? key}) : super(key: key);

  void onPress(BuildContext context, {required int index}) {
    switch (index) {
      case 0:
        context.read<NavigationCubit>().push(RootPath.settingThemes);
        break;
      case 1:
        context.read<NavigationCubit>().push(RootPath.settingLanguages);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListSettingCommonView(this, settings: settings);
  }
}
