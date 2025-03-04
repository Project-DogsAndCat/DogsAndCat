import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/settings_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required repository})
      : _repository = repository,
        super(ThemeState(brightness: Brightness.dark)) {
    _checkThemeSelected();
  }

  final SettingsRepository _repository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness: brightness));
    await _repository.setDarkThemeSelected(
        selected: brightness == Brightness.dark);
  }

  void _checkThemeSelected() {
    final brightness =
        _repository.isDarkThemeSelected() ? Brightness.dark : Brightness.light;
    emit(ThemeState(brightness: brightness));
  }
}
