part of '_repositories.dart';

class SharedPreferencesRepository {
  // keys
  static const String _themeKey = "themeKey";

  // theme
  Future<int> getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(_themeKey) ?? 0;
  }

  Future<void> setTheme(int value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(_themeKey, value);
  }

  // destroySharedPreferences
  // call this method if you want to clear all keys/value
  // stored on the app device dir
  Future<void> destroySharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }
}
