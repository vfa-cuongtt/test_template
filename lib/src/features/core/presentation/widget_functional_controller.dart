import 'package:flutter/material.dart';

abstract class WidgetFunctionalController<Controller> extends StatelessWidget {
  const WidgetFunctionalController(this.state, {Key? key}) : super(key: key);

  final Controller state;
}
