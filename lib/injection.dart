import 'core/dotenv/dotenv_client.dart';
import 'core/hive/hive_client.dart';
import 'l10n/l10n.dart';
import 'main.dart';

// DO NOT FORGET TO CALL AWAIT
Future<void> init() async {

  //init Hive (Shared Pref)
  await HiveClient.globalInitialize();

  // Initialize Localization
  LocalizationService.instance.init(local.value);

  //load the .env file
  await DotEnvClient.init();

}