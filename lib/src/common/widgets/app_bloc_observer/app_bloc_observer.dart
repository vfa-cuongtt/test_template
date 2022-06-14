import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class AppBlocObserver extends BlocObserver {
  AppBlocObserver({required Logger logger}) : _logger = logger;

  final Logger _logger;
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logger.d('onCreate Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger
      ..d('onChange Bloc type-- ${bloc.runtimeType}')
      ..d('onChange Bloc CurrentState-- ${change.currentState}')
      ..d('onChange Bloc NextState-- ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.d('onError Bloc-- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logger.d('onClose Bloc-- ${bloc.runtimeType}');
  }
}
