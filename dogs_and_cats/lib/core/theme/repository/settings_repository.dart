abstract interface class SettingsRepository {
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected({required bool selected});
}
