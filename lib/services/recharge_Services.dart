// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/rechargePlans.dart';
import '../utils/export_file.dart';

class LoginServices extends GetxService {
  final String mobilePlan = 'MobilePlan/';

  static var client = http.Client();

  Future<RechargePlans?> mobileRecharge(
      String token, String phone, String code, String circle) async {
    //'http://97.74.81.248:2020/api/MobilePlan/9640861076/TS/1'
    var url = Uri.parse("$NewDEVURL$mobilePlan$phone/$code/$circle");
    var headers = {'Authorization': token};
    var response = await client.get(url, headers: headers);
    RechargePlans? mobilePlans;
    if (response.statusCode == 200) {
      debugPrint(response.body);
      mobilePlans = RechargePlans.fromJson(jsonDecode(response.body));
    } else {
      debugPrint("API Calling Failed");
    }
    return mobilePlans;
  }

  // Future<RechargePlans?> dthRecharge(
  //     String token, String phone, String code, String circle) async {
  //   var url = Uri.parse(NewDEVURL + mobilePlan);
  //   var headers = {'Authorization': token};
  //   //'http://97.74.81.248:2020/api/MobilePlan/9640861076/TS/1'
  //   var response = await client.get(url, headers: headers);
  //   RechargePlans? dthPlans;
  //   if (response.statusCode == 200) {
  //     debugPrint(response.body);
  //     dthPlans = RechargePlans.fromJson(jsonDecode(response.body));
  //   } else {
  //     debugPrint("API Calling Failed");
  //   }
  //   return dthPlans;
  // }
}
