import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo {
  Future<bool> checkKeys(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(key);
  }

  Future<void> setData(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<String> readData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }

  Future<void> deleteData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
