import '../models/signUpModes.dart';
import '../services/login_services.dart';
import '../utils/export_file.dart';

class LoginController extends GetxController {
  final LoginServices loginServices = Get.find<LoginServices>();
  final Rxn<MyUser> _myuser = Rxn<MyUser>();
  MyUser get myuser => _myuser.value ?? MyUser();

  final Rxn<bool> _isSkipped = Rxn<bool>();
  bool get isSkipped => _isSkipped.value ?? false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController fcmController = TextEditingController();

  void skipPressed(bool isSkipped) {
    _isSkipped(isSkipped);
  }

  void getUserInfo()async{
    UserInfo? userInfo = await loginServices.getUserInfo(_myuser.value!.token);
  }

  Future<bool> login(
      BuildContext context, String password, String email, String fcm) async {
    bool isUpdated = false;
    try {
      MyUser? myUser = await loginServices.login(context, password, email, fcm);
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
}
