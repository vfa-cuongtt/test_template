import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class WidgetHookController<Controller> extends HookWidget {
  const WidgetHookController(this.state, {Key? key}) : super(key: key);

  final Controller state;
}
