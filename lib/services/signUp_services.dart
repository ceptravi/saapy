import 'dart:convert';

import '../models/signUpModes.dart';

import 'package:http/http.dart' as http;

import '../utils/export_file.dart';

class SignUpServices extends GetxService {
  final String lsignUoAPI = 'UserRegister';

  static var client = http.Client();

  Future register(
    BuildContext context,
    String? name,
    String? password,
    String? email,
    String? phone,
    String? fcmtoken,
    String? refcode,
  ) async {
    var url = Uri.parse(NewDEVURL + lsignUoAPI);
    // var headers = {
    //   "Accept": "application/json",
    //   "content-type": "application/json",
    // };
    // var data = {
    //   "name": name,
    //   "password": password,
    //   "confirm_password": confirmPassword,
    //   "phone": phone,
    //   "email": email,
    //   "fcm_token": fcmtoken,
    //   "refcode": refcode
    // };

    Register? register;
    try {
      var response = await client.post(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "password": password,
          "confirm_password": password,
          "phone": phone,
          "email": email,
          "fcm_token": fcmtoken,
          "refcode": refcode
        }),
      );
      debugPrint('statusCode: ${response.body}');
      if (response.statusCode == 200) {
        try {
          register = registerFromJson(response.body);
        } on Exception catch (e) {
          debugPrint('Exception while parsing the json $e');
          throw Exception(e);
        }
      } else {
        debugPrint('Update profile Failed on Backend');
        throw Exception('Update profile Failed on Backend');
      }
    } on Exception catch (e) {
      debugPrint('Update profile Failed on Backend - ${e.toString()}');
      throw Exception('Update profile Failed on Backend');
    }
    return register;
  }
}
