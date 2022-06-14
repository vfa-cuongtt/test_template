import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_template/src/features/themes/constants/app_themes.dart';
import 'package:test_template/src/features/themes/domain/entities/theme_entity.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(),
        ) {
    on<ThemeChangedEvent>(_onThemeChanged);
  }

  Future<void> _onThemeChanged(
    ThemeChangedEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(
      state.copyWith(
        appThemeConfig: AppThemeConfig.getAppThemeConfig(event.theme),
      ),
    );
  }
}
