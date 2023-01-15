import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:moon_start_builders/models/wallet.dart';

import '../utils/export_file.dart';

class WalletServices extends GetxService {
  final String addMoneyApi = 'AddMoney';
  final String passbook = 'Passbook';
  final String paytoWalletAPI = 'PayToWallet';
  final String myOrdersAPI = 'MyOrders';
  final String myKycTypes = 'KyvTypes';
  final String myScraychCards = 'Myscratchcards';
  final String myScraychCardsCleared = 'Clear_scratchcard/';

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

  Future<MyPassbook?> getMyOrders(String token) async {
    MyPassbook? myPassbook;

    var url = Uri.parse(NewDEVURL + myOrdersAPI);
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

  Future<KycTypes?> getKycTypes(String token) async {
    KycTypes? kycTypes;

    var url = Uri.parse(NewDEVURL + myKycTypes);
    var headers = {'Authorization': token};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        kycTypes = KycTypes.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return kycTypes;
  }

  Future<PayToWallet?> paytoWalletApi(
      String token,
      String phone,
      dynamic amount,
      int payMentMode,
      String description,
      String couponCode) async {
    PayToWallet? payToWallet;

    var url = Uri.parse(NewDEVURL + paytoWalletAPI);
    var headers = {'Authorization': token};
    var data = jsonEncode({
      {
        "phonenumber": phone,
        "amount": amount,
        "payment_mode": payMentMode,
        "description": description,
        "coupon_code": couponCode
      }
    });
    try {
      var response = await client.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        payToWallet = PayToWallet.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return payToWallet;
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

  Future<MyScratchCards?> getMyScratchCards(String token) async {
    MyScratchCards? myScratchCardsData;

    var url = Uri.parse(NewDEVURL + myScraychCards);
    var headers = {'Authorization': token};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        myScratchCardsData = MyScratchCards.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return myScratchCardsData;
  }

  Future<CardCleared?> clearedScratchCard(String token, int id) async {
    CardCleared? clearedScratchCard;
    //http://97.74.81.248:2020/api/Clear_scratchcard/181
    //http://97.74.81.248:2020/api/Clear_scratchcard/181
    var url = Uri.parse(NewDEVURL + myScraychCardsCleared + "$id");
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        clearedScratchCard = CardCleared.fromJson(jsonDecode(response.body));
        // ignore: unnecessary_null_comparison
        if (clearedScratchCard == null) {
          Fluttertoast.showToast(
            msg: 'Coupon Expired',
            backgroundColor: Colors.grey,
          );
        }
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return clearedScratchCard;
  }
}
