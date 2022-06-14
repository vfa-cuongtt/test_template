part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  ThemeState({
    AppThemeConfig? appThemeConfig,
  }) : appThemeConfig = appThemeConfig ?? AppThemeConfig.normal();

  final AppThemeConfig appThemeConfig;

  @override
  List<Object> get props => [appThemeConfig];

  ThemeState copyWith({
    AppThemeConfig? appThemeConfig,
  }) =>
      ThemeState(
        appThemeConfig: appThemeConfig ?? AppThemeConfig.normal(),
      );
}
