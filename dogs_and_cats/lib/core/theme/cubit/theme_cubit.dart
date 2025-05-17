import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repository/settings_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required repository})
      : _repository = repository,
        super(ThemeState(brightness: Brightness.dark)) {
    checkThemeSelected();
  }

  final SettingsRepository _repository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    final session = getIt<SupabaseClient>().auth.currentSession;
    emit(ThemeState(brightness: brightness));
    await _repository.setDarkThemeSelected(
        personId: session?.user.id, selected: brightness == Brightness.dark);
  }

  void resetTheme() {
    emit(ThemeState(brightness: Brightness.light));
  }

  void checkThemeSelected() {
    final session = getIt<SupabaseClient>().auth.currentSession;
    final brightness =
        _repository.isDarkThemeSelected(personId: session?.user.id)
            ? Brightness.dark
            : Brightness.light;
    emit(ThemeState(brightness: brightness));
  }
}
