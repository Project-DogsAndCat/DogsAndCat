part of 'theme_cubit.dart';

class ThemeState {
  ThemeState({required this.brightness});
  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;
}
