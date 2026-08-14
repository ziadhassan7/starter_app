import 'package:hive/hive.dart';
import 'hive_client.dart';
import 'hive_keys.dart';

class AppSettingsLocalDataSource {
  final Box _box = HiveClient.instance.appSettingsBox;

  /// Current Language
  String? getDefaultLang() => _box.get(LOCALE_LANG_KEY, defaultValue: 'en');
  Future<void> saveDefaultLang(String? value) => _box.put(LOCALE_LANG_KEY, value);


  /// Theme Mode
  String? getTheme() {
    return _box.get(THEME_MODE);
  }

  Future<void> setThemeMode(String mode) async =>
      await _box.put(THEME_MODE, mode);
}