import 'package:dogs_and_cats/core/theme/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.preferences});
  final SharedPreferences preferences;
  static const _isDarkThemeSelectedKey = 'dark_theme_selected';

  @override
  bool isDarkThemeSelected() {
    final selected = preferences.getBool(_isDarkThemeSelectedKey);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected({required bool selected}) async {
    await preferences.setBool(_isDarkThemeSelectedKey, selected);
  }
}
