part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    this.currentLanguage =
        const LanguageEntity(id: '0', name: 'English', languageCode: 'en'),
  });

  final LanguageEntity currentLanguage;

  @override
  List<Object?> get props => [currentLanguage];

  LanguageState copyWith({LanguageEntity? currentLanguage}) => LanguageState(
        currentLanguage: currentLanguage ?? this.currentLanguage,
      );
}
