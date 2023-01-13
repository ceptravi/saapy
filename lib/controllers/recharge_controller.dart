import '../models/homeServices.dart';
import '../models/rechargePlans.dart';
import '../services/homeCategory_services.dart';
import '../utils/export_file.dart';
import 'login_controller.dart';

class RechargeController extends GetxController {
  final HomeServices _homeServices = Get.find<HomeServices>();
  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  final Rxn<Services> _services = Rxn<Services>();
  Services get services => _services.value ?? Services();

  final Rxn<Circles> _circles = Rxn<Circles>();
  Circles get circles => _circles.value ?? Circles();

  final Rxn<KycTypes> _kyctypes = Rxn<KycTypes>();
  KycTypes get kyctypes => _kyctypes.value ?? KycTypes();

  final Rxn<AddWalletPayment> _addWalletPayment = Rxn<AddWalletPayment>();
  AddWalletPayment get addWalletPayment =>
      _addWalletPayment.value ?? AddWalletPayment();

  final Rxn<MyScratchCards> _myScartchCards = Rxn<MyScratchCards>();
  MyScratchCards get myScartchCards =>
      _myScartchCards.value ?? MyScratchCards();

  TextEditingController numberController = TextEditingController();

  Future<bool> callingProviderCategory(
      String name, int type, String route) async {
    String token = Get.find<LoginController>().myuser.token!;

    Services? services = await _homeServices.services(token, name, type);
    _services(services);

    return services!.data!.isNotEmpty ? true : false;
  }

  Future<bool> getCircleDetails(String module, String route) async {
    String token = Get.find<LoginController>().myuser.token!;

    Circles? circlesData = await _homeServices.getCircles(token, module);
    _circles(circlesData);

    return circlesData!.data!.isNotEmpty ? true : false;
  }

  Future<bool> getScratchCards(String route) async {
    String token = Get.find<LoginController>().myuser.token!;

    MyScratchCards? myScratchCards = await _homeServices.getScratchCards(token);
    _myScartchCards(myScratchCards);

    return true;
  }

  Future<bool> getKycTypes(String route) async {
    String token = Get.find<LoginController>().myuser.token!;

    KycTypes? kycTypes = await _homeServices.getKycType(token);
    _kyctypes(kycTypes);

    return true;
  }

  Future<bool> addAmountToWallet(String route) async {
    String token = Get.find<LoginController>().myuser.token!;

    AddWalletPayment? addWalletPayment =
        await _homeServices.addWalletAmount(token);
    _addWalletPayment(addWalletPayment);

    return true;
  }
}
