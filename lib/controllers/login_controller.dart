import '../models/signUpModes.dart';
import '../services/login_services.dart';
import '../utils/export_file.dart';

class LoginController extends GetxController {
  final LoginServices loginServices = Get.find<LoginServices>();
  final Rxn<MyUser> _myuser = Rxn<MyUser>();
  MyUser get myuser => _myuser.value ?? MyUser();
  final Rxn<UserInfo> _userInfo = Rxn<UserInfo>();
  UserInfo get userInfo => _userInfo.value ?? UserInfo();


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

  void skipPressed(bool isSkipped) {
    _isSkipped(isSkipped);
  }


  void getUserInfo()async{
    _isLoading(true);
    UserInfo? userInfo = await loginServices.getUserInfo(_myuser.value!.token);
    _userInfo(userInfo);
     _isLoading(false);
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

  updateDOB(String gender){
    _userInfo.value!.data!.gender = gender;
  }
  updateProfileInfo(String name,String email,String dob,String address,String phone)async{

    UserInfo? userInfo = await loginServices.updateUserInfo(_myuser.value!.token!,name,email,dob,address,phone);
    _userInfo(userInfo);


  }
}
