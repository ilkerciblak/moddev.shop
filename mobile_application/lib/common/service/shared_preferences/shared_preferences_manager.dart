import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final SharedPreferences _preferences;

  SharedPreferencesManager({required SharedPreferences preferences})
      : _preferences = preferences;

  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<void> saveDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  Future<void> removePair(String key) async {
    await _preferences.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }
}
