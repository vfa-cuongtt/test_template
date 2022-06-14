part of 'app_lifecycle_bloc.dart';

abstract class AppLifecycleStateCustom extends Equatable {
  const AppLifecycleStateCustom();
}

class AppLifecycleInitial extends AppLifecycleStateCustom {
  @override
  List<Object> get props => [];
}

class AppLifecyclePlayedOriginal extends AppLifecycleStateCustom {
  @override
  List<Object> get props => [];
}

class AppLifecycleForeground extends AppLifecycleStateCustom {
  @override
  List<Object> get props => [];
}

class AppLifecycleBackground extends AppLifecycleStateCustom {
  @override
  List<Object> get props => [];
}

class AppLifecycleKilled extends AppLifecycleStateCustom {
  @override
  List<Object> get props => [];
}
