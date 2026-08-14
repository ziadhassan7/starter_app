import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvClient {

  //DO NOT forget to call await when you use this function
  static Future<void> init() async {
    // To load the .env file contents into dotenv
    await dotenv.load(fileName: ".env");
  }

  static String? get firstKey => dotenv.env['FIRST_KEY'];
}