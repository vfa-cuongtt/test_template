import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/configs/dependency_injection/injection.dart';
import 'package:test_template/src/common/widgets/visibility_device_preview/visibility_device_preview.dart';
import 'package:test_template/src/features/app_lifecycle/presentation/lifecycle_watcher/bloc/app_lifecycle_bloc.dart';
import 'package:test_template/src/features/app_lifecycle/presentation/lifecycle_watcher/lifecycle_watcher_controller.dart';
import 'package:test_template/src/features/core/flavors/flavor_config.dart';
import 'package:test_template/src/features/languages/presentation/pages/bloc/language_bloc.dart';
import 'package:test_template/src/features/themes/presentation/pages/bloc/theme_bloc.dart';
import 'package:test_template/src/localization/app_localization_setup.dart';
import 'package:test_template/src/routers/bloc/navigation_cubit.dart';
import 'package:test_template/src/routers/constants/root_path.dart';
import 'package:test_template/src/routers/e_route_information_parser.dart';
import 'package:test_template/src/routers/e_router_delegate.dart';
import 'package:test_template/src/routers/page_config.dart';
import 'package:hive/hive.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.devicePreview}) : super(key: key);

  final VisibilityDevicePreview? devicePreview;

  ERouteInformationParser get routeInformationParser =>
      ERouteInformationParser();

  Box<PageConfig>? get pageConfig {
    if (getIt<FlavorConfig>().enabledRestoreNavigation) {
      return getIt<Box<PageConfig>>();
    }
    return null;
  }

  ERouterDelegate get routerDelegate => ERouterDelegate(
        cubit: NavigationCubit(
          [PageConfig(location: RootPath.settings)],
          pageConfig,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
        BlocProvider<AppLifecycleBloc>(create: (_) => AppLifecycleBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (previous, current) =>
            previous.appThemeConfig != current.appThemeConfig,
        builder: (_, state) {
          final appThemeConfig = state.appThemeConfig;
          return BlocBuilder<LanguageBloc, LanguageState>(
            buildWhen: (previous, current) =>
                previous.currentLanguage != current.currentLanguage,
            builder: (_, state) {
              final locale = Locale.fromSubtags(
                languageCode: state.currentLanguage.languageCode,
              );
              return LifecycleWatcherController(
                child: MaterialApp.router(
                  title: getIt<FlavorConfig>().title,
                  theme: appThemeConfig.light,
                  darkTheme: appThemeConfig.dark,
                  routeInformationParser: routeInformationParser,
                  routerDelegate: routerDelegate,
                  localizationsDelegates:
                      AppLocalizationSetup.localizationsDelegates,
                  supportedLocales: AppLocalizationSetup.supportedLocales,
                  localeResolutionCallback:
                      AppLocalizationSetup.localeResolutionCallback,
                  locale: locale,
                  useInheritedMediaQuery:
                      devicePreview?.useInheritedMediaQuery ?? false,
                  builder: (context, widget) {
                    final widgetDevicePreview = devicePreview != null
                        ? devicePreview?.builder(context, widget)
                        : widget;
                    return ResponsiveWrapper.builder(
                      BouncingScrollWrapper.builder(
                        context,
                        widgetDevicePreview!,
                      ),
                      defaultScale: true,
                      breakpoints: [
                        const ResponsiveBreakpoint.resize(
                          380,
                          name: MOBILE,
                        ),
                        const ResponsiveBreakpoint.autoScale(
                          800,
                          name: TABLET,
                        ),
                        const ResponsiveBreakpoint.autoScale(
                          1000,
                          name: TABLET,
                        ),
                        const ResponsiveBreakpoint.resize(
                          1200,
                          name: DESKTOP,
                        ),
                        const ResponsiveBreakpoint.autoScale(
                          2460,
                          name: '4K',
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
