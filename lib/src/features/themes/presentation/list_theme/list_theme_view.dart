import 'package:flutter/material.dart';
import 'package:test_template/src/features/core/presentation/widget_hook_controller.dart';
import 'package:test_template/src/features/themes/domain/entities/theme_entity.dart';
import 'package:test_template/src/features/themes/presentation/list_theme/list_theme_controller.dart';
import 'package:test_template/src/features/themes/presentation/widgets/atoms/item_theme/item_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListThemeView extends WidgetHookController<ListThemeController> {
  const ListThemeView(
    ListThemeController state, {
    Key? key,
    required this.themes,
  }) : super(state, key: key);

  final List<ThemeEntity> themes;

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////
    // Define variable
    //////////////////////////////////////////////////////////
    final index = useState(0);

    //////////////////////////////////////////////////////////
    // Handle event animation
    //////////////////////////////////////////////////////////
    void _onReorder(int oldIndex, int newIndex) {
      if (oldIndex < newIndex) {
        index.value = newIndex - 1;
      } else {
        index.value = newIndex;
      }
      final item = themes.removeAt(oldIndex);
      themes.insert(index.value, item);
      state.onReorder(context, currentTheme: themes.first);
    }

    //////////////////////////////////////////////////////////
    // Widget tree goes here.
    //////////////////////////////////////////////////////////
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: themes.length,
      itemBuilder: (BuildContext context, int index) {
        return ReorderableDragStartListener(
          key: ValueKey('theme_$index'),
          index: index,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ItemTheme(name: themes[index].name, onPressed: () {}),
              if (index != themes.length - 1)
                const Divider(
                  height: 1,
                ),
            ],
          ),
        );
      },
      onReorder: _onReorder,
    );
  }
}
