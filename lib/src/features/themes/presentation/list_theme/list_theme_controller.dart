import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/features/themes/constants/themes.dart';
import 'package:test_template/src/features/themes/domain/entities/theme_entity.dart';
import 'package:test_template/src/features/themes/presentation/list_theme/list_theme_view.dart';
import 'package:test_template/src/features/themes/presentation/pages/bloc/theme_bloc.dart';

class ListThemeController extends StatelessWidget {
  const ListThemeController({Key? key}) : super(key: key);

  void onReorder(
    BuildContext context, {
    required ThemeEntity currentTheme,
  }) {
    context.read<ThemeBloc>().add(
          ThemeChangedEvent(theme: currentTheme),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListThemeView(this, themes: themes);
  }
}
