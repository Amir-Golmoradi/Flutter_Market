import 'package:flutter_dunimarket/config/constant/constants.dart';
import 'package:flutter_dunimarket/config/styles/theme/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences prefs;

  // ========================================================
  // THEME PERSIST STATUS

  Future<void> saveThemeToPrefs(PocketTheme theme) async {
    final themePref = await SharedPreferences.getInstance();
    await themePref.setInt(saveThemeKey, theme.index);
  }

  Future<PocketTheme?> getThemeFromPrefs() async {
    final themeIndex = prefs.getInt(saveThemeKey);
    if (themeIndex != null) {
      return PocketTheme.values[themeIndex];
    }
    return null;
  }

// ========================================================
  // INTRO STATUS

  Future<void> setIntroStatus() async {
    prefs = await SharedPreferences.getInstance();

    await prefs.setBool(introStatusKey, true);
  }

  Future<bool> getIntroStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userIntroStatus = prefs.getBool(introStatusKey) ?? false;
    return userIntroStatus;
  }

  // ========================================================
  // AUTHENTICATION STATUS

  Future<void> setAuthStatus() async {
    prefs = await SharedPreferences.getInstance();

    await prefs.setBool(authStatusKey, true);
  }

  Future<bool> getAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userAuthStatus = prefs.getBool(authStatusKey) ?? false;
    return userAuthStatus;
  }
}
