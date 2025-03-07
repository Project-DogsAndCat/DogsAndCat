abstract interface class SettingsRepository {
  bool isDarkThemeSelected({String? personId});
  Future<void> setDarkThemeSelected({String? personId, required bool selected});
}
