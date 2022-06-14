import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
    required this.customCardColor,
  });

  /// initial factory constructor based file enums.dart

  //////////////////////////////////////////////////////////
  // Color scheme for normal
  //////////////////////////////////////////////////////////
  /// light theme
  factory CustomColors.normalLight() => const CustomColors(
        success: Color(0xff28a745),
        info: Color(0xff17a2b8),
        warning: Color(0xffffc107),
        danger: Color(0xffdc3545),
        customCardColor: Color(0xffffffff),
      );

  /// dark theme
  factory CustomColors.normalDark() => const CustomColors(
        success: Color(0xff28a745),
        info: Color(0xff17a2b8),
        warning: Color(0xffffc107),
        danger: Color(0xffdc3545),
        customCardColor: Color(0xff8E8E93),
      );

  //////////////////////////////////////////////////////////
  // Color scheme for primary
  //////////////////////////////////////////////////////////
  /// light theme
  factory CustomColors.primaryLight() => const CustomColors(
        success: Color(0xff28a745),
        info: Color(0xff17a2b8),
        warning: Color(0xffffc107),
        danger: Color(0xffdc3545),
        customCardColor: Color(0xffffffff),
      );

  /// dark theme
  factory CustomColors.primaryDark() => const CustomColors(
        success: Color(0xff28a745),
        info: Color(0xff17a2b8),
        warning: Color(0xffffc107),
        danger: Color(0xffdc3545),
        customCardColor: Color(0xff8E8E93),
      );

  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? danger;
  final Color? customCardColor;

  @override
  CustomColors copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
    Color? customCardColor,
  }) {
    return CustomColors(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      customCardColor: customCardColor ?? this.customCardColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      success: Color.lerp(success, other.success, t),
      info: Color.lerp(info, other.info, t),
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
      customCardColor: Color.lerp(customCardColor, other.customCardColor, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'success: $success, info: $info, warning: $info, danger: $danger'
      ')';
}
