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

  Rxn<KycTypes> _kycTypes = Rxn<KycTypes>();
  KycTypes get kycTypes => _kycTypes.value ?? KycTypes();

  Rxn<PayToWallet> _payToWallet = Rxn<PayToWallet>();
  PayToWallet get payToWallet => _payToWallet.value ?? PayToWallet();

  Rxn<MyPassbook> _myPassBookData = Rxn<MyPassbook>();
  MyPassbook get myPassBookData => _myPassBookData.value ?? MyPassbook();

  Rxn<MyPassbook> _myOrders = Rxn<MyPassbook>();
  MyPassbook get myOrders => _myOrders.value ?? MyPassbook();

  Rxn<CardCleared> _clearedCard = Rxn<CardCleared>();
  CardCleared get clearedCard => _clearedCard.value ?? CardCleared();

  Rxn<MyScratchCards> _myScratchCards = Rxn<MyScratchCards>();
  MyScratchCards get myScratchCards =>
      _myScratchCards.value ?? MyScratchCards();

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

  Future<bool> paytowallet(String phone, dynamic amount, int payMentMode,
      String description, String couponCode) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    PayToWallet? payToWallet = await walletServices.paytoWalletApi(
        token, phone, amount, payMentMode, description, couponCode);
    _payToWallet(payToWallet);
    _isLoading(false);
    return true;
  }

  buttonPressed(String route) async {
    myPassbook();
    Get.toNamed(route);
  }

  myCardsPressed(String route) async {
    getMyScartchCards();
    Get.toNamed(route);
  }

  getMyOrders() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    MyPassbook? myOrders = await walletServices.getMyOrders(token);
    _myOrders(myOrders);
    _isLoading(false);
  }

  getKycTypes() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    KycTypes? kycTypes = await walletServices.getKycTypes(token);
    _kycTypes(kycTypes);
    _isLoading(false);
  }

  getMyScartchCards() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    MyScratchCards? myScratchCards =
        await walletServices.getMyScratchCards(token);
    _myScratchCards(myScratchCards);
    _isLoading(false);
  }

  cardScratched(int id) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    CardCleared? clearedCard =
        await walletServices.clearedScratchCard(token, id);
    _clearedCard(clearedCard);
    _isLoading(false);
  }
}
