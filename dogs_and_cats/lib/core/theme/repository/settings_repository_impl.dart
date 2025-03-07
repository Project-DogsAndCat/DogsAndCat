import 'package:dogs_and_cats/core/theme/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.preferences});
  final SharedPreferences preferences;

  @override
  bool isDarkThemeSelected({String? personId}) {
    if (personId != null) {
      final selected = preferences.getBool(personId);
      return selected ?? false;
    }
    return false;
  }

  @override
  Future<void> setDarkThemeSelected(
      {String? personId, required bool selected}) async {
    if (personId != null) {
      await preferences.setBool(personId, selected);
    }
  }
}
