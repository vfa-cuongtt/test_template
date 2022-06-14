part of 'app_lifecycle_bloc.dart';

abstract class AppLifecycleEvent extends Equatable {
  const AppLifecycleEvent();
}

class AppLifecycleChangedToPlayedOriginal extends AppLifecycleEvent {
  const AppLifecycleChangedToPlayedOriginal();

  @override
  List<Object?> get props => [];
}

class AppLifecycleChangedToBackground extends AppLifecycleEvent {
  const AppLifecycleChangedToBackground();

  @override
  List<Object?> get props => [];
}

class AppLifecycleChangedToForeground extends AppLifecycleEvent {
  const AppLifecycleChangedToForeground();

  @override
  List<Object?> get props => [];
}

class AppLifecycleChangedToKilled extends AppLifecycleEvent {
  const AppLifecycleChangedToKilled();

  @override
  List<Object?> get props => [];
}
