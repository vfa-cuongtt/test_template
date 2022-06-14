import 'package:flutter/material.dart';
import 'package:test_template/src/features/core/presentation/widget_hook_controller.dart';
import 'package:test_template/src/features/languages/domain/entities/language_entity.dart';
import 'package:test_template/src/features/languages/presentation/list_languages/list_language_controller.dart';
import 'package:test_template/src/features/languages/presentation/widgets/atoms/item_language/item_language.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListLanguageView extends WidgetHookController<ListLanguageController> {
  const ListLanguageView(
    ListLanguageController state, {
    Key? key,
    required this.languages,
  }) : super(state, key: key);

  final List<LanguageEntity> languages;

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
      final item = languages.removeAt(oldIndex);
      languages.insert(index.value, item);
      state.onReorder(context, currentLanguage: languages.first);
    }

    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: languages.length,
      itemBuilder: (BuildContext context, int index) {
        return ReorderableDragStartListener(
          key: ValueKey('language_$index'),
          index: index,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ItemLanguage(name: languages[index].name, onPressed: () {}),
              if (index != languages.length - 1)
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
