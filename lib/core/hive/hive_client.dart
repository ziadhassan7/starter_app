import 'package:hive_flutter/hive_flutter.dart';
import 'hive_keys.dart';

class HiveClient {

  final Box globalBox;
  final Box appSettingsBox;

  static final HiveClient instance = HiveClient._init(); //singleton

  HiveClient._init()
      : globalBox = Hive.box(GLOBAL_DATA_BOX),
        appSettingsBox = Hive.box(APP_SETTINGS_BOX);


  //Call this on your main method
  static Future<void> globalInitialize() async {
    await Hive.initFlutter();
    await Hive.openBox(GLOBAL_DATA_BOX);
    await Hive.openBox(APP_SETTINGS_BOX);
  }
}