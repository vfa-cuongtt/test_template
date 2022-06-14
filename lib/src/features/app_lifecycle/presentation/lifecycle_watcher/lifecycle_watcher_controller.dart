import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/configs/dependency_injection/injection.dart';
import 'package:test_template/src/features/app_lifecycle/presentation/lifecycle_watcher/bloc/app_lifecycle_bloc.dart';
import 'package:test_template/src/features/app_lifecycle/presentation/lifecycle_watcher/lifecycle_watcher_view.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:logger/logger.dart';

class LifecycleWatcherController extends StatefulWidget {
  const LifecycleWatcherController({Key? key, required this.child})
      : super(
          key: key,
        );

  final Widget child;

  @override
  State<LifecycleWatcherController> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcherController>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    IsFirstRun.isFirstRun().then<bool>((value) {
      context.read<AppLifecycleBloc>().add(
            const AppLifecycleChangedToPlayedOriginal(),
          );
      return value;
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _handleAppNotFocused() {
    getIt<Logger>().d('Event app is not focused');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        _handleAppNotFocused();
        break;
      case AppLifecycleState.paused:
        context.read<AppLifecycleBloc>().add(
              const AppLifecycleChangedToBackground(),
            );
        break;
      case AppLifecycleState.resumed:
        context.read<AppLifecycleBloc>().add(
              const AppLifecycleChangedToForeground(),
            );
        break;
      case AppLifecycleState.detached:
        context.read<AppLifecycleBloc>().add(
              const AppLifecycleChangedToKilled(),
            );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LifecycleWatcherView(child: widget.child);
  }
}
