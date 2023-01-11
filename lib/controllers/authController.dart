// ignore: file_names
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/signUpModes.dart';

class AuthController extends GetxController {
  final Rxn<MyUser> _authdata = Rxn<MyUser>();
  MyUser get authdata => _authdata.value ?? MyUser();


}
