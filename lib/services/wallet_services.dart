import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:moon_start_builders/models/wallet.dart';

import '../utils/export_file.dart';

class WalletServices extends GetxService {
  final String addMoneyApi = 'AddMoney';
  final String addMoneyApiStatus = 'AddMoneyPaymentStatusUpdate/';
  final String passbook = 'Passbook';
  final String paytoWalletAPI = 'PayToWallet';
  final String paytoWalletAPIStatus = 'PayToWalletPayMentStatusUpdate/';
  final String myOrdersAPI = 'MyOrders';
  final String myKycTypes = 'KyvTypes';
  final String addKycData = 'AddKyc';
  final String mybeneficiers = 'Mybeneficiers';
  final String addbeneficiers = 'AddBeneficier';
  final String updatebeneficiers = 'UpdateBeneficier/';
  final String deletebeneficiers = 'DeleteBeneficier/';
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

  // Future<MyPassbook?> getPassBookDetails(String token) async {
  //   MyPassbook? myPassbook;

  //   var url = Uri.parse(NewDEVURL + passbook);
  //   var headers = {'Authorization': token};
  //   try {
  //     var response = await client.post(url, headers: headers);
  //     if (response.statusCode == 200) {
  //       debugPrint(response.body);
  //       myPassbook = MyPassbook.fromJson(jsonDecode(response.body));
  //     } else {
  //       debugPrint("API Calling Failed");
  //     }
  //   } catch (e) {
  //     debugPrint("error $e");
  //   }

  //   return myPassbook;
  // }

  // getbankDetails

  Future<MyBankDetails?> getbankDetails(String token) async {
    MyBankDetails? myBankDetails;

    var url = Uri.parse(NewDEVURL + mybeneficiers);
    var headers = {'Authorization': token};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        myBankDetails = MyBankDetails.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return myBankDetails;
  }

  Future<AddBankDetails?> addBankDetails(String token) async {
    AddBankDetails? addBankDetails;

    var url = Uri.parse(NewDEVURL + addbeneficiers);
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var data = {
      "beneficiername": "Testingname",
      "accountnumber": "2311223322",
      "ifsc": "223222",
      "bankname": "3233",
      "mobilenumber": "4433444444",
      "upiid": "55544",
      "paytm_number": "6446",
      "amazon_number": "73477"
    };
    try {
      var response =
          await client.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        addBankDetails = AddBankDetails.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return addBankDetails;
  }

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

  Future<KycTypes?> addKycDetails(
      String token, String number, String image) async {
    KycTypes? kycTypes;

    var url = Uri.parse(NewDEVURL + addKycData);
    var headers = {'Authorization': token};
    var data = {
      {
        "basic_or_full_type": "full",
        "kyctype_id": 1,
        "number": "112111",
        "image ": "w34525235255"
      }
    };
    try {
      var response =
          await client.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        kycTypes = KycTypes.fromJson(jsonDecode(response.body));
        if (kycTypes == null) {
          Map map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
        }
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return kycTypes;
  }

  Future<MybeneficiersDetails?> getMybeneficiersDetails(String token) async {
    MybeneficiersDetails? mybeneficiersDetails;

    var url = Uri.parse(NewDEVURL + mybeneficiers);
    var headers = {'Authorization': token};
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        mybeneficiersDetails =
            MybeneficiersDetails.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return mybeneficiersDetails;
  }

  Future<AddbeneficiersDetailsData?> addMybeneficiersDetails(
      String token,
      String beneficiername,
      String accountnumber,
      String ifsc,
      String bankname,
      String mobilenumber,
      String upiid,
      String paytmNumber,
      String amazonNumber) async {
    AddbeneficiersDetailsData? addbeneficiersDetailsData;

    var url = Uri.parse(NewDEVURL + addbeneficiers);
    var headers = {'Authorization': token};
    var data = {
      "beneficiername": beneficiername,
      "accountnumber": accountnumber,
      "ifsc": ifsc,
      "bankname": bankname,
      "mobilenumber": bankname,
      "upiid": upiid,
      "paytm_number": paytmNumber,
      "amazon_number": amazonNumber
    };
    try {
      var response =
          await client.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        addbeneficiersDetailsData =
            AddbeneficiersDetailsData.fromJson(jsonDecode(response.body));
        if (addbeneficiersDetailsData == null) {
          Map map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
        }
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return addbeneficiersDetailsData;
  }

  Future<UpdatebeneficiersDetails?> updateMybeneficiersDetails(
      int id,
      String token,
      String beneficiername,
      String accountnumber,
      String ifsc,
      String bankname,
      String mobilenumber,
      String upiid,
      String paytmNumber,
      String amazonNumber) async {
    UpdatebeneficiersDetails? updatebeneficiersDetails;

    var url = Uri.parse(NewDEVURL + updatebeneficiers + "$id");
    var headers = {'Authorization': token};
    var data = {
      "beneficiername": beneficiername,
      "accountnumber": accountnumber,
      "ifsc": ifsc,
      "bankname": bankname,
      "mobilenumber": bankname,
      "upiid": upiid,
      "paytm_number": paytmNumber,
      "amazon_number": amazonNumber
    };
    try {
      var response =
          await client.put(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        updatebeneficiersDetails =
            UpdatebeneficiersDetails.fromJson(jsonDecode(response.body));
        if (updatebeneficiersDetails == null) {
          Map map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
        }
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return updatebeneficiersDetails;
  }

  Future<DeleteBeneficierAccount?> deleteMybeneficiersDetails(
    int id,
    String token,
  ) async {
    DeleteBeneficierAccount? deleteBeneficierAccount;

    var url = Uri.parse(NewDEVURL + deletebeneficiers + "$id");
    var headers = {'Authorization': token};
    try {
      var response = await client.put(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        deleteBeneficierAccount =
            DeleteBeneficierAccount.fromJson(jsonDecode(response.body));
        if (deleteBeneficierAccount == null) {
          Map map = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: '${map['message']}',
            backgroundColor: Colors.grey,
          );
        } else {
          Fluttertoast.showToast(
            msg: '${deleteBeneficierAccount.message}',
            backgroundColor: Colors.grey,
          );
        }
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return deleteBeneficierAccount;
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

  Future<WalletPaymentStatus?> paytoWalletApiResponse(
      String token, PayToWallet payToWallet) async {
    WalletPaymentStatus? walletPaymentStatus;

    var url = Uri.parse(NewDEVURL +
        paytoWalletAPIStatus +
        "${walletPaymentStatus!.data!.txnid}");
    var headers = {'Authorization': token};
    var data = jsonEncode({
      {
        "order_id": walletPaymentStatus.data!.orderid,
        "status": "Success",
        "payment_response": walletPaymentStatus.data!.txnid,
        "ipaddress": "49.207.5.204",
        "browser":
            "Dalvik/2.1.0 (Linux; U; Android 9; RMX1831 Build/PPR1.180610.011)",
        "app_version": "1.2"
      }
    });
    try {
      var response = await client.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        walletPaymentStatus =
            WalletPaymentStatus.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return walletPaymentStatus;
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

  Future<AddMoneyStatus?> addMoneyToWalletConfirmationStatus(
      String token, AddMoney addMoney) async {
    AddMoneyStatus? addMoneyStatus;

    var url = Uri.parse(NewDEVURL + addMoneyApiStatus + "${addMoney.data!.id}");
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};

    try {
      var response = await client.put(url,
          headers: headers,
          body: jsonEncode({
            "status": "Success",
            "payment_response": addMoney.data!.txnid,
            "order_id": addMoney.data!.orderid,
            "ipaddress": "49.207.5.204",
            "browser":
                "Dalvik/2.1.0 (Linux; U; Android 9; RMX1831 Build/PPR1.180610.011)",
            "app_version": "1.2"
          }));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        addMoneyStatus = AddMoneyStatus.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("API Calling Failed");
      }
    } catch (e) {
      debugPrint("error $e");
    }

    return addMoneyStatus;
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
