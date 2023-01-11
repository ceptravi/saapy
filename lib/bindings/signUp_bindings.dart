import '../controllers/signUp-controller.dart';
import '../services/signUp_services.dart';
import '../utils/export_file.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<SignUpServices>(() => SignUpServices());
  }
}
