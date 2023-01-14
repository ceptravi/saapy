import '../models/homeServices.dart';
import '../models/rechargePlans.dart';
import '../services/homeCategory_services.dart';
import '../utils/export_file.dart';
import 'login_controller.dart';

class RechargeController extends GetxController {
  final HomeServices _homeServices = Get.find<HomeServices>();
  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  final Rxn<bool> _networkSelect = Rxn<bool>();
  bool get networkSelect => _networkSelect.value ?? false;

  final Rxn<int> _preOrPosr = Rxn<int>();
  int get preOrPosr => _preOrPosr.value ?? 0;

  final Rxn<String> _network = Rxn<String>();
  String get network => _network.value ?? "";

  final Rxn<String> _providerCode = Rxn<String>();
  String get providerCode => _providerCode.value ?? "";

  final Rxn<String> _circle = Rxn<String>();
  String get circle => _circle.value ?? "";

  final Rxn<String> _moduleName = Rxn<String>();
  String get moduleName => _moduleName.value ?? "";

  final Rxn<Services> _services = Rxn<Services>();
  Services get services => _services.value ?? Services();

  final Rxn<RechargePlans> _rechargePlans = Rxn<RechargePlans>();
  RechargePlans get rechargePlans => _rechargePlans.value ?? RechargePlans();

  final Rxn<Circles> _circles = Rxn<Circles>();
  Circles get circles => _circles.value ?? Circles();

  final Rxn<RechargePlansData> _rechargePlan = Rxn<RechargePlansData>();
  RechargePlansData get rechargePlan =>
      _rechargePlan.value ?? RechargePlansData();

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
    _moduleName(name);
    _preOrPosr(type);
    String token = Get.find<LoginController>().myuser.token!;

    Services? services = await _homeServices.services(token, name, type);
    _services(services);

    return services!.data!.isNotEmpty ? true : false;
  }

  getCircleDetails() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;

    Circles? circlesData =
        await _homeServices.getCircles(token, _moduleName.value!);
    _circles(circlesData);
    _isLoading(false);
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

  getRechargePlans() async {
    _isLoading(true);
    String token = Get.find<LoginController>().myuser.token!;

    RechargePlans? rechargePlans = await _homeServices.rechargePlans(
        token, "9985091823", _providerCode.value!, _preOrPosr.value!);
    _rechargePlans(rechargePlans);
    _addWalletPayment(addWalletPayment);
    _isLoading(false);
  }

  networkSelected(String network, String code) {
    _network(network);
    _providerCode(code);
  }

  circleSelected(String circle) {
    _circle(circle);
  }

  storeRechargePlan(RechargePlansData? rechargePlansData) {
    _rechargePlan(rechargePlansData);
    debugPrint("${rechargePlansData!.desc}");
  }
}
