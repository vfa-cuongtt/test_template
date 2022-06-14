import 'package:flutter/material.dart';
import 'package:test_template/src/features/settings/domain/entities/setting_entity.dart';
import 'package:test_template/src/features/settings/presentation/list_setting/item_setting.dart';

class ListSettings extends StatelessWidget {
  const ListSettings({Key? key, required this.settings, this.onPressed})
      : super(key: key);

  final List<SettingEntity> settings;
  final void Function(BuildContext, {required int index})? onPressed;

  @override
  Widget build(BuildContext context) {
    return _ListSettingView(
      settings: settings,
      onPressed: onPressed,
    );
  }
}

class _ListSettingView extends StatefulWidget {
  const _ListSettingView({Key? key, required this.settings, this.onPressed})
      : super(key: key);

  final List<SettingEntity> settings;
  final void Function(BuildContext, {required int index})? onPressed;

  @override
  State<_ListSettingView> createState() => _ListSettingViewState();
}

class _ListSettingViewState extends State<_ListSettingView> {
  late List<SettingEntity> _listSetting;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initialListSetting();
  }

  void _initialListSetting() {
    _listSetting = <SettingEntity>[];
    var future = Future(() {});
    for (var i = 0; i < widget.settings.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _listSetting.add(widget.settings[i]);
          _listKey.currentState?.insertItem(
            i,
            duration: const Duration(milliseconds: 750),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: _listSetting.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutQuart,
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: ItemSetting(
                  setting: _listSetting[index],
                  onPressed: () => widget.onPressed?.call(
                    context,
                    index: index,
                  ),
                ),
              ),
            ),
            if (index != _listSetting.length - 1)
              const Divider(
                height: 1,
              ),
          ],
        );
      },
    );
  }
}
