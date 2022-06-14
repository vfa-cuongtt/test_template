import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_template/src/features/settings/domain/entities/setting_entity.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({Key? key, required this.setting, this.onPressed})
      : super(key: key);

  final SettingEntity setting;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashFactory: InkRipple.splashFactory,
      splashColor: CupertinoColors.opaqueSeparator.withOpacity(0.2),
      highlightColor: CupertinoColors.opaqueSeparator.withOpacity(0.1),
      hoverColor: CupertinoColors.opaqueSeparator.withOpacity(0.1),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: Image.network(setting.image),
        ),
        title: Text(setting.name),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
        ),
        dense: false,
      ),
    );
  }
}
