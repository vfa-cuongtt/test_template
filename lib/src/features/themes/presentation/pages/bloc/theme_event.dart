part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangedEvent extends ThemeEvent {
  const ThemeChangedEvent({required this.theme});

  final ThemeEntity theme;

  @override
  List<Object?> get props => [theme];
}
