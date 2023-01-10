import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/signUpModes.dart';

class AuthController extends GetxController {
  Rxn<Register> _register = Rxn<Register>();
  Register get register => _register.value ?? Register();
}
