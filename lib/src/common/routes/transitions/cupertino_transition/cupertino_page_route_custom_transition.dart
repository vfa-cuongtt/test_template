import 'package:flutter/cupertino.dart';

class CupertinoPageRouteCustomTransition<T> extends CupertinoPageRoute<T> {
  CupertinoPageRouteCustomTransition({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(settings: settings, builder: builder);

  /// add time transition you want
  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);
}
