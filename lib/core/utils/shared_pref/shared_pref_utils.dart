import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static final SharedPreferencesUtils _sharedPreferencesUtils =
      SharedPreferencesUtils._internal();
  static late SharedPreferences prefs;

  factory SharedPreferencesUtils() {
    return _sharedPreferencesUtils;
  }

  SharedPreferencesUtils._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> addStringList(
      {required String key, required List<String> value}) async {
    return await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList({required String key}) async {
    return await prefs.getStringList(key);
  }
}
