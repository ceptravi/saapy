import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import '../models/signUpModes.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../utils/export_file.dart';

class LoginServices extends GetxService {
  final String loginAPI = 'UserLogin';
  final String getUserDataAPI = 'UserDetails';

  static var client = http.Client();

  Future<MyUser?> login(
    BuildContext context,
    String? password,
    String? email,
    String? fcmtoken,
  ) async {
    var url = Uri.parse(NewDEVURL + loginAPI);
    MyUser? myUser;
    try {
      var response = await client.post(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "password": password,
          "email": email,
          "fcm_token": fcmtoken,
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

  Future<UserInfo?> getUserInfo(String? token) async {
    var url = Uri.parse(NewDEVURL + getUserDataAPI);
    UserInfo? userInfo;
    try {
      var response = await client.get(
        url,
        headers: {"Authorization": token!},
      );
      debugPrint("StatusCode = ${response.statusCode}");
      userInfo = UserInfo.fromJson(jsonDecode(response.body));
      debugPrint("Serializing done");
    } catch (e) {
      debugPrint("UserData API Calling Faield $e");
    }

    return userInfo;
  }

  Future<UserInfo?> updateUserInfo(String token, String name, String email,
      String dob, String address, String phone) async {
    var url = Uri.parse(NewDEVURL + getUserDataAPI);
    UserInfo? userInfo;
    try {
      var response = await client.get(
        url,
        headers: {"Authorization": token},
      );
      debugPrint("StatusCode = ${response.statusCode}");
      userInfo = UserInfo.fromJson(jsonDecode(response.body));
      debugPrint("Serializing done");
    } catch (e) {
      debugPrint("UserData API Calling Faield $e");
    }

    return userInfo;
  }
}
