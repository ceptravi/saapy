

import 'package:moon_start_builders/utils/export_file.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const String isUserLoggedIn = 'isuserloggedin';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setLoginStatus({required bool loginStatus}) async {
    await _preferences.setBool(isUserLoggedIn, loginStatus);
  }

  static bool? getLoginStatus() {
    return _preferences.getBool(isUserLoggedIn);
  }
}
