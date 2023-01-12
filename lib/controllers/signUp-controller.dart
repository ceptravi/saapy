import '../models/signUpModes.dart';
import '../services/signUp_services.dart';
import '../utils/export_file.dart';

class SignUpController extends GetxController {
  final SignUpServices signUpServices = Get.find<SignUpServices>();
  Rxn<Register> _register = Rxn<Register>();
  Register get register => _register.value ?? Register();

    Rxn<ResendOtp> _resendOtp = Rxn<ResendOtp>();
  ResendOtp get resendOTP => _resendOtp.value ?? ResendOtp();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController fcmController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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
      if (register == null) {
        isUpdated = false;
      } else {
        isUpdated = true;
      }
    } catch (e) {
      debugPrint("API Failed");
      isUpdated = false;
    }

    return isUpdated;
  }
  Future<bool> checkOtp(
      BuildContext context,
      String otp,
      ) async {
    bool isUpdated = false;
    try {
      Register? register = await signUpServices.checkOtp(
          context, otp,_register.value!.data!.userId!);
      _register(register);
      if (register == null) {
        isUpdated = false;
      } else {
        isUpdated = true;
      }
    } catch (e) {
      debugPrint("API Failed");
      isUpdated = false;
    }

    return isUpdated;
  }
    Future<bool> resendOtp(
      BuildContext context,
      ) async {
    bool isUpdated = false;
    try {
      ResendOtp? resendOtp = await signUpServices.resendOtp(
          context, _register.value!.data!.userId!);
      _resendOtp(resendOtp);
      if (resendOtp == null) {
        isUpdated = false;
      } else {
        isUpdated = true;
      }
    } catch (e) {
      debugPrint("API Failed");
      isUpdated = false;
    }

    return isUpdated;
  }
}
