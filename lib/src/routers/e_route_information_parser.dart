import 'package:flutter/cupertino.dart';
import 'package:test_template/src/routers/page_config.dart';

class ERouteInformationParser extends RouteInformationParser<PageConfig> {
  ///get a location (path) from the system and build your route wrapping object
  @override
  Future<PageConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final path = routeInformation.location ?? '';
    final config = PageConfig(location: path);
    return config;
  }

  ///update the URL bar with the latest URL from the app
  @override
  RouteInformation? restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path.toString());
  }
}
