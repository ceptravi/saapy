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

  Rxn<MybeneficiersDetails> _myBenificerDetails = Rxn<MybeneficiersDetails>();
  MybeneficiersDetails get myBenificerDetails =>
      _myBenificerDetails.value ?? MybeneficiersDetails();

  Rxn<AddbeneficiersDetailsData> _addBenificerDetails =
      Rxn<AddbeneficiersDetailsData>();
  AddbeneficiersDetailsData get addBenificerDetails =>
      _addBenificerDetails.value ?? AddbeneficiersDetailsData();

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
    if (addMoney != null) {
      await walletServices.addMoneyToWalletConfirmationStatus(token, addMoney);
    }
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
    if (payToWallet != null) {
      WalletPaymentStatus? walletPaymentStatus =
          await walletServices.paytoWalletApiResponse(token, payToWallet);
    }
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

  addKycDetails(String number, String image) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    KycTypes? kycTypes =
        await walletServices.addKycDetails(token, number, image);
    _kycTypes(kycTypes);
    _isLoading(false);
  }

  getMybeneficiersDetails() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    MybeneficiersDetails? mybeneficiersDetails =
        await walletServices.getMybeneficiersDetails(token);
    _myBenificerDetails(mybeneficiersDetails);
    _isLoading(false);
  }

  addMybeneficiersDetails(
      String beneficiername,
      String accountnumber,
      String ifsc,
      String bankname,
      String mobilenumber,
      String upiid,
      String paytmNumber,
      String amazonNumber) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    AddbeneficiersDetailsData? addbeneficiersDetailsData =
        await walletServices.addMybeneficiersDetails(
            token,
            beneficiername,
            accountnumber,
            ifsc,
            bankname,
            mobilenumber,
            upiid,
            paytmNumber,
            amazonNumber);
    _addBenificerDetails(addbeneficiersDetailsData);
    _isLoading(false);
  }

  updateMybeneficiersDetails(
      int id,
      String beneficiername,
      String accountnumber,
      String ifsc,
      String bankname,
      String mobilenumber,
      String upiid,
      String paytmNumber,
      String amazonNumber) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    UpdatebeneficiersDetails? updatebeneficiersDetails =
        await walletServices.updateMybeneficiersDetails(
            id,
            token,
            beneficiername,
            accountnumber,
            ifsc,
            bankname,
            mobilenumber,
            upiid,
            paytmNumber,
            amazonNumber);
    // _addBenificerDetails(addbeneficiersDetailsData);
    _isLoading(false);
  }

  deleteMybeneficiersDetails(
    int id,
  ) async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;
    DeleteBeneficierAccount? deleteBeneficierAccount =
        await walletServices.deleteMybeneficiersDetails(id, token);
    getMybeneficiersDetails();
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
