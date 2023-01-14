import 'package:moon_start_builders/controllers/login_controller.dart';
import 'package:moon_start_builders/models/wallet.dart';

import '../services/wallet_services.dart';
import '../utils/export_file.dart';

class WalletController extends GetxController {
  final WalletServices walletServices = Get.find<WalletServices>();
  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  Rxn<AddMoney> _addmoney = Rxn<AddMoney>();
  AddMoney get addmoney => _addmoney.value ?? AddMoney();

  Rxn<MyPassbook> _myPassBookData = Rxn<MyPassbook>();
  MyPassbook get myPassBookData => _myPassBookData.value ?? MyPassbook();

  TextEditingController addMoneyController = TextEditingController();

  setLoadingFalse() {
    _isLoading(false);
  }

  Future<bool> addMoney(String money, String? couponCode) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    AddMoney? addMoney =
        await walletServices.addMoneyToWallet(token, money, couponCode!);
    _addmoney(addMoney);
    _isLoading(false);
    return true;
  }

  Future<bool> myPassbook() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    MyPassbook? myPassbook = await walletServices.getPassBookDetails(token);
    _myPassBookData(myPassbook);
    _isLoading(false);
    return true;
  }

  buttonPressed(String route) async {
    myPassbook();
    Get.toNamed(route);
  }
}
