import 'package:flutter/material.dart';
import 'package:test_template/src/features/themes/constants/custom_color_scheme.dart';
import 'package:test_template/src/features/themes/constants/enums.dart';
import 'package:test_template/src/features/themes/domain/entities/theme_entity.dart';

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();

class AppThemeConfig {
  factory AppThemeConfig.getAppThemeConfig(ThemeEntity theme) {
    switch (theme.code) {
      case SelectAppTheme.normal:
        return AppThemeConfig.normal();
      case SelectAppTheme.primary:
        return AppThemeConfig.primary();
    }
  }
  AppThemeConfig.normal()
      : _constructorType = SelectAppTheme.normal,
        light = lightTheme.copyWith(
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: ThemeData.light().scaffoldBackgroundColor,
          ),
          extensions: <ThemeExtension<dynamic>>[
            CustomColors.normalLight(),
          ],
        ),
        dark = darkTheme.copyWith(
          extensions: <ThemeExtension<dynamic>>[
            CustomColors.normalDark(),
          ],
        );

  AppThemeConfig.primary()
      : _constructorType = SelectAppTheme.primary,
        light = lightTheme.copyWith(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
          extensions: <ThemeExtension<dynamic>>[
            CustomColors.primaryLight(),
          ],
        ),
        dark = darkTheme.copyWith(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
          ),
          extensions: <ThemeExtension<dynamic>>[
            CustomColors.primaryDark(),
          ],
        );

  final SelectAppTheme _constructorType;
  final ThemeData light;
  final ThemeData dark;

  @override
  String toString() {
    return '[AppThemeConfig]: $_constructorType';
  }
}
