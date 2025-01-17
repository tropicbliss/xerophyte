import 'package:shared_preferences/shared_preferences.dart';

const String _prefKey = "last_file_path";

class EditorPersistence {
  static Future<void> saveLastPath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, path);
  }

  static Future<String?> getLastPath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_prefKey);
  }

  static Future<void> clearLastPath() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefKey);
  }
}
