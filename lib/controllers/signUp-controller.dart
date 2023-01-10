import '../models/signUpModes.dart';
import '../services/signUp_services.dart';
import '../utils/export_file.dart';

class SignUpController extends GetxController {
  final SignUpServices signUpServices = Get.find<SignUpServices>();
  Rxn<Register> _register = Rxn<Register>();
  Register get register => _register.value ?? Register();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController fcmController = TextEditingController();

  Future<bool> registerAccount(
      BuildContext context,
      String name,
      String password,
      String email,
      String phone,
      String fcm,
      String referal) async {
    bool isUpdated = false;
    try {
      Register? register = await signUpServices.register(
          context, name, password, email, phone, fcm, referal);
      _register(register);
      if (register == null)
        isUpdated = false;
      else
        isUpdated = true;
    } catch (e) {
      debugPrint("API Failed");
      isUpdated = false;
    }

    return isUpdated;
  }
}
