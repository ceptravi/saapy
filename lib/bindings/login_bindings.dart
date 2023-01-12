
import '../controllers/login_controller.dart';
import '../services/login_services.dart';
import '../services/signUp_services.dart';
import '../utils/export_file.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginServices>(() => LoginServices());
    Get.lazyPut<SignUpServices>(() => SignUpServices());
  }
}
