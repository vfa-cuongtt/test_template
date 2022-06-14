import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/utilities/extensions/string_extension.dart';
import 'package:test_template/src/features/languages/presentation/list_languages/list_language_controller.dart';
import 'package:test_template/src/localization/app_localization.dart';
import 'package:test_template/src/routers/bloc/navigation_cubit.dart';
import 'package:test_template/src/routers/e_page.dart';

class LanguagePage extends EPage {
  const LanguagePage({required Map<String, dynamic> args}) : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const LanguageScreenController();
  }

  @override
  Route createRoute(BuildContext context) {
    return super.transitionCupertino();
  }
}

class LanguageScreenController extends StatelessWidget {
  const LanguageScreenController({Key? key}) : super(key: key);

  void onBack(BuildContext context) {
    context.read<NavigationCubit>().pop();
  }

  @override
  Widget build(BuildContext context) {
    return LanguageScreenView(this);
  }
}

class LanguageScreenView extends StatelessWidget {
  const LanguageScreenView(this.state, {Key? key}) : super(key: key);

  final LanguageScreenController state;

  @override
  Widget build(BuildContext context) {
    final titleLanguage =
        AppLocalization.of(context)?.languages.defaultTo('').toTitleCase();
    final textBack =
        AppLocalization.of(context)?.back.defaultTo('').capitalize();

    return Scaffold(
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
              onTap: () => state.onBack(context),
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
        title: Text(titleLanguage!),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: const ListLanguageController(),
        ),
      ),
    );
  }
}
