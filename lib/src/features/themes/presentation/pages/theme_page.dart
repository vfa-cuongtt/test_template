import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/utilities/extensions/string_extension.dart';
import 'package:test_template/src/features/themes/presentation/list_theme/list_theme_controller.dart';
import 'package:test_template/src/localization/app_localization.dart';
import 'package:test_template/src/routers/bloc/navigation_cubit.dart';
import 'package:test_template/src/routers/e_page.dart';

class ThemePage extends EPage {
  const ThemePage({required Map<String, dynamic> args}) : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const ThemeScreenController();
  }

  @override
  Route createRoute(BuildContext context) {
    return super.transitionCupertino();
  }
}

class ThemeScreenController extends StatelessWidget {
  const ThemeScreenController({Key? key}) : super(key: key);

  void onBack(BuildContext context) {
    context.read<NavigationCubit>().pop();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeScreenView(this);
  }
}

class ThemeScreenView extends StatelessWidget {
  const ThemeScreenView(this.state, {Key? key}) : super(key: key);

  final ThemeScreenController state;

  @override
  Widget build(BuildContext context) {
    final titleTheme =
        AppLocalization.of(context)?.themes.defaultTo('').toTitleCase();
    final textBack =
        AppLocalization.of(context)?.back.defaultTo('').capitalize();

    return AnimatedTheme(
      data: Theme.of(context),
      duration: const Duration(milliseconds: 750),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 150,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(8),
                splashFactory: InkRipple.splashFactory,
                splashColor: CupertinoColors.link.withOpacity(0.2),
                highlightColor: CupertinoColors.link.withOpacity(0.1),
                hoverColor: CupertinoColors.link.withOpacity(0.1),
                onTap: () => state.onBack.call(context),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 24,
                        color: CupertinoColors.link,
                      ),
                      Text(
                        textBack!,
                        style: const TextStyle(color: CupertinoColors.link),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          title: Text(titleTheme!),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 12),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: const ListThemeController(),
          ),
        ),
      ),
    );
  }
}
