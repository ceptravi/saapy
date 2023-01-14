import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:moon_start_builders/models/wallet.dart';

import '../utils/export_file.dart';

class WalletServices extends GetxService {
  final String addMoneyApi = 'AddMoney';
  final String passbook = 'Passbook';

  static var client = http.Client();

  // Future<AddMoney?> addMoneyToWallet(
  //     String token, String money, String? couponCode) async {
  //   AddMoney? addMoney;
  //   var url = Uri.parse(NewDEVURL + addMoneyApi);
  //   var headers = {'Authorization': token};
  //   var data = {"amount": money, "coupon_code": "1234"};
  //   debugPrint(jsonEncode(data));
  //   debugPrint("$url");
  //   try {
  //     var response =
  //         await client.post(url, headers: headers, body: jsonEncode(data));
  //     if (response.statusCode == 200) {
  //       debugPrint(response.body);
  //       addMoney = AddMoney.fromJson(jsonDecode(response.body));
  //     } else {
  //       debugPrint("API Calling Failed");
  //     }
  //   } catch (e) {
  //     debugPrint("error $e");
  //   }

  //   return addMoney;
  // }

  Future<MyPassbook?> getPassBookDetails(String token) async {
    MyPassbook? myPassbook;

    var url = Uri.parse(NewDEVURL + passbook);
    var headers = {'Authorization': token};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        myPassbook = MyPassbook.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return myPassbook;
  }

  Future<AddMoney?> addMoneyToWallet(
      String token, String money, String coupon) async {
    AddMoney? addMoney;

    var url = Uri.parse(NewDEVURL + addMoneyApi);
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};

    try {
      var response = await client.post(url,
          headers: headers,
          body: jsonEncode({"amount": money, "coupon_code": coupon}));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        addMoney = AddMoney.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return addMoney;
  }
}
