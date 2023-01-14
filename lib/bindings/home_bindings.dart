import '../controllers/login_controller.dart';
import '../controllers/recharge_controller.dart';
import '../services/homeCategory_services.dart';
import '../services/recharge_Services.dart';
import '../services/wallet_services.dart';
import '../utils/export_file.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechargeController>(() => RechargeController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RechargeServices>(() => RechargeServices());
    Get.lazyPut<HomeServices>(() => HomeServices());
    Get.lazyPut<WalletServices>(() => WalletServices());
  }
}
