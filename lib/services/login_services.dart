import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import '../models/signUpModes.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../utils/export_file.dart';

class LoginServices extends GetxService {
  final String loginAPI = 'UserLogin';
  final String getUserDataAPI = 'UserDetails';
  final String updateUserDataAPI = 'UpdateUser';
  final String forgotpassword = 'Forgotpassword';
  final String userLogout = 'UserLogout';

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
          "fcm_token": "test",
        }),
      );
      debugPrint('statusCode: ${response.body}');
      if (response.statusCode == 200) {
        try {
          myUser = MyUser.fromJson(jsonDecode(response.body));
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

  Future<bool> logOut(String token) async {
    var url = Uri.parse(NewDEVURL + userLogout);
    try {
      var response = await client.post(
        url,
        headers: {"Authorization": token, 'Content-Type': 'application/json'},
        body: jsonEncode({
          "otp": 1,
          "ipaddress": "49.207.5.204",
          "browser":
              "Dalvik/2.1.0 (Linux; U; Android 9; RMX1831 Build/PPR1.180610.011)",
          "app_version": "1.2"
        }),
      );
      debugPrint('statusCode: ${response.body}');
      if (response.statusCode == 200) {
        try {
          Map map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
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
    return true;
  }

  Future<UserInfo?> getUserInfo(String? token) async {
    var url = Uri.parse(NewDEVURL + getUserDataAPI);
    UserInfo? userInfo;
    try {
      var response = await client.get(
        url,
        headers: {"Authorization": token!, 'Content-Type': 'application/json'},
      );
      debugPrint("StatusCode = ${response.body}");
      userInfo = UserInfo.fromJson(jsonDecode(response.body));
      debugPrint("Serializing done");
    } catch (e) {
      debugPrint("UserData API Calling Faield $e");
    }

    return userInfo;
  }

  Future<UpdateUser?> updateUserInfo(String token, String name, String email,
      String dob, String address, String phone, String gender) async {
    var url = Uri.parse(NewDEVURL + updateUserDataAPI);
    UpdateUser? userInfo;
    var data = jsonEncode({
      "name": name,
      "email": email,
      "dob": dob,
      "address": address,
      "gender": gender
    });
    try {
      var response = await client.put(url,
          headers: {"Authorization": token, 'Content-Type': 'application/json'},
          body: data);
      debugPrint("StatusCode = ${response.statusCode}");
      try {
        userInfo = UpdateUser.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
          msg: 'Updated Succesfully',
          backgroundColor: Colors.grey,
        );
      } catch (e) {
        Map map = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: '${map['message'][0]}',
          backgroundColor: Colors.grey,
        );
      }
      debugPrint("Serializing done");
    } catch (e) {
      debugPrint("UserData API Calling Faield $e");
    }

    return userInfo;
  }

  Future<Map?> forgotPassword(
    String? phone,
  ) async {
    var url = Uri.parse(NewDEVURL + forgotpassword);
    Map map;
    try {
      var response = await client.post(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "email": phone,
        }),
      );
      debugPrint('statusCode: ${response.body}');

      if (response.statusCode == 200) {
        try {
          map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
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
    return map;
  }
}
