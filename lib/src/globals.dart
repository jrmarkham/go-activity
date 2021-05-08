import 'dart:io';

export 'package:go_activity_app/src/globals/assets.dart';
export 'package:go_activity_app/src/globals/constants.dart';
export 'package:go_activity_app/src/globals/enum_methods.dart';
export 'package:go_activity_app/src/globals/enums.dart';

const String ENGLISH = 'en';

class Globals {
  static String _language;
  static String title;
  static bool isIOS = Platform.isIOS;

  static Map<String, dynamic> localization;

  static Future<void> initGlobal() async {
    // set core lang to ENGLISH
    title = 'Go Activity App';
    _language = ENGLISH;
//    localization = await getLangData();
  }

// LOCALIZATION
// static Future<Map<String, dynamic>> getLangData() async {
//   String data = await rootBundle.loadString('assets/json/$_language/core.json');
//   return json.decode(data);
// }
}
