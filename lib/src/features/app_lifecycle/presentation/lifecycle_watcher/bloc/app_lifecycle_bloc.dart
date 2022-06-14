import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_lifecycle_event.dart';
part 'app_lifecycle_state.dart';

class AppLifecycleBloc
    extends Bloc<AppLifecycleEvent, AppLifecycleStateCustom> {
  AppLifecycleBloc() : super(AppLifecycleInitial()) {
    on<AppLifecycleChangedToPlayedOriginal>(
      _onAppLifecycleChangedToPlayedOriginal,
    );
    on<AppLifecycleChangedToBackground>(_onAppLifecycleChangedToBackground);
    on<AppLifecycleChangedToForeground>(_onAppLifecycleChangedToForeground);
    on<AppLifecycleChangedToKilled>(_onAppLifecycleChangedToKilled);
  }

  void _onAppLifecycleChangedToPlayedOriginal(
    AppLifecycleChangedToPlayedOriginal event,
    Emitter<AppLifecycleStateCustom> emit,
  ) {
    emit(AppLifecyclePlayedOriginal());
  }

  void _onAppLifecycleChangedToBackground(
    AppLifecycleChangedToBackground event,
    Emitter<AppLifecycleStateCustom> emit,
  ) {
    emit(AppLifecycleBackground());
  }

  void _onAppLifecycleChangedToForeground(
    AppLifecycleChangedToForeground event,
    Emitter<AppLifecycleStateCustom> emit,
  ) {
    emit(AppLifecycleForeground());
  }

  void _onAppLifecycleChangedToKilled(
    AppLifecycleChangedToKilled event,
    Emitter<AppLifecycleStateCustom> emit,
  ) {
    emit(AppLifecycleKilled());
  }
}
