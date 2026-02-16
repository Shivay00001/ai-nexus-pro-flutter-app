import 'package:hive_flutter/hive_flutter.dart';
import '../constants/api_constants.dart';

class StorageService {
  static late Box _authBox;
  static late Box _settingsBox;

  static Future<void> init() async {
    _authBox = await Hive.openBox(StorageConstants.authBox);
    _settingsBox = await Hive.openBox(StorageConstants.settingsBox);
  }

  // Auth Methods
  static Future<void> saveToken(String token) async {
    await _authBox.put(AppConstants.tokenKey, token);
  }

  static String? getToken() {
    return _authBox.get(AppConstants.tokenKey);
  }

  static Future<void> deleteToken() async {
    await _authBox.delete(AppConstants.tokenKey);
  }

  // Theme Methods
  static Future<void> setThemeMode(bool isDark) async {
    await _settingsBox.put(AppConstants.themeModeKey, isDark);
  }

  static Future<bool> getThemeMode() async {
    return _settingsBox.get(AppConstants.themeModeKey, defaultValue: false);
  }

  // Language Methods
  static Future<void> setLanguage(String languageCode) async {
    await _settingsBox.put(AppConstants.languageKey, languageCode);
  }

  static String getLanguage() {
    return _settingsBox.get(AppConstants.languageKey, defaultValue: 'en');
  }

  // Clear Storage
  static Future<void> clearAll() async {
    await _authBox.clear();
    await _settingsBox.clear();
  }
}
