import 'package:flutter/cupertino.dart';

class LifecycleWatcherView extends StatelessWidget {
  const LifecycleWatcherView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
