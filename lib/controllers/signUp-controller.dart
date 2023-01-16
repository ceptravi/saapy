import 'package:fluttertoast/fluttertoast.dart';
import 'package:moon_start_builders/controllers/login_controller.dart';

import '../models/signUpModes.dart';
import '../services/signUp_services.dart';
import '../utils/export_file.dart';

class SignUpController extends GetxController {
  final SignUpServices signUpServices = Get.find<SignUpServices>();
  Rxn<Register> _register = Rxn<Register>();
  Register get register => _register.value ?? Register();

  Rxn<ResendOtp> _resendOtp = Rxn<ResendOtp>();
  ResendOtp get resendOTP => _resendOtp.value ?? ResendOtp();

  final Rxn<MyUser> _myuser = Rxn<MyUser>();
  MyUser get myuser => _myuser.value ?? MyUser();

  final Rxn<bool> _isSkipped = Rxn<bool>();
  bool get isSkipped => _isSkipped.value ?? false;

  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController fcmController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void skipPressed(bool isSkipped) {
    _isSkipped(isSkipped);
  }

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
      MyUser? myUser = await signUpServices.checkOtp(
          context,
          otp,
          _register.value != null
              ? _register.value!.data!.userId!
              : Get.find<LoginController>().uid);
      _myuser(myUser);
      if (myUser == null) {
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
    _isLoading(true);
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
      Fluttertoast.showToast(
        msg: 'Please Try Later',
        backgroundColor: Colors.grey,
      );
      debugPrint("API Failed");
      isUpdated = false;
    }
    _isLoading(false);

    return isUpdated;
  }
}
