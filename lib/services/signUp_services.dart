import 'dart:convert';

import '../models/signUpModes.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../utils/export_file.dart';

class SignUpServices extends GetxService {
  final String lsignUoAPI = 'UserRegister';
  final String loginWithotp = 'LoginWithotp';
  final String resendotp = 'Resendotp';

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
          try {
            register = registerFromJson(response.body);
          } catch (e) {
            if (register == null) {
              Map map = jsonDecode(response.body);
              Fluttertoast.showToast(
                msg: '${map['message']}',
                backgroundColor: Colors.grey,
              );
            }
          }
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

  Future checkOtp(BuildContext context, String? otp, int? id) async {
    var url = Uri.parse(NewDEVURL + loginWithotp);
    MyUser? myUser;
    try {
      var response = await client.post(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "ipaddress": "49.207.5.204",
          "browser":
              "Dalvik/2.1.0 (Linux; U; Android 9; RMX1831 Build/PPR1.180610.011)",
          "app_version": "1.2",
          "type": "signup",
          "user_id": id,
          "otp": otp,
          "password": "root",
          "confirm_password": "root"
        }),
      );
      debugPrint('statusCode: ${response.body}');
      if (response.statusCode == 200) {
        try {
          try {
            myUser = MyUser.fromJson(jsonDecode(response.body));
          } catch (e) {
            if (myUser == null) {
              Map map = jsonDecode(response.body);
              Fluttertoast.showToast(
                msg: '${map['message']}',
                backgroundColor: Colors.grey,
              );
            }
          }
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
    return myUser;
  }

  Future resendOtp(
    BuildContext context,
    int? id,
  ) async {
    var url = Uri.parse(NewDEVURL + resendotp);
    ResendOtp? resendOtp;
    try {
      var response = await client.post(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({"type": "register", "user_id": id}),
      );
      debugPrint('statusCode: ${response.body}');
      if (response.statusCode == 200) {
        try {
          resendOtp = ResendOtp.fromJson(jsonDecode(response.body));
          Fluttertoast.showToast(
            msg: '${resendOtp.message}',
            backgroundColor: Colors.grey,
          );
        } on Exception catch (e) {
          debugPrint('Exception while parsing the json $e');
          throw Exception(e);
        }
      } else {
        debugPrint('resendOtp Failed on Backend');
        throw Exception('resendOtpFailed on Backend');
      }
    } on Exception catch (e) {
      debugPrint('Update profile Failed on Backend - ${e.toString()}');
      throw Exception('Update profile Failed on Backend');
    }
    return resendOtp;
  }
}
