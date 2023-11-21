import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  // ignore: unused_field
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else // (value is String)
    {
      await _preferences.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return _preferences.get(key);
  }

  static String? getString({required String key}) {
    return _preferences.getString(key);
  }

  static Future<void> removeData({required String key}) async {
    await _preferences.remove(key);
  }

  static Future<bool> clearData() async {
    return await _preferences.clear();
  }
}
