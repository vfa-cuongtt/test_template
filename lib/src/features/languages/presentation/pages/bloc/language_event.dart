part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LanguageChangedEvent extends LanguageEvent {
  const LanguageChangedEvent({required this.currentLanguage});

  final LanguageEntity currentLanguage;

  @override
  List<Object?> get props => [currentLanguage];
}
