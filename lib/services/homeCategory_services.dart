// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/homeServices.dart';
import '../utils/export_file.dart';

class HomeServices extends GetxService {
  final String allProviders = 'AllProviders/';

  static var client = http.Client();

  Future<Services?> services(String token, String name, String type) async {
    var url = Uri.parse("$NewDEVURL$allProviders$name/$type/");
    var headers = {'Authorization': token};
    //'http://97.74.81.248:2020/api/AllProviders/Landline/0'
    var response = await client.get(url, headers: headers);
    Services? services;
    if (response.statusCode == 200) {
      debugPrint(response.body);
      services = Services.fromJson(jsonDecode(response.body));
    } else {
      debugPrint("API Calling Failed");
    }
    return services;
  }
}
