import 'package:moon_start_builders/services/login_services.dart';

import '../controllers/login_controller.dart';
import '../controllers/wallet_controller.dart';
import '../services/signUp_services.dart';
import '../services/wallet_services.dart';
import '../utils/export_file.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<WalletServices>(() => WalletServices());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginServices>(() => LoginServices());
    Get.lazyPut<SignUpServices>(() => SignUpServices());
  }
}
