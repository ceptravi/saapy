import '../utils/export_file.dart';

class RechargeController extends GetxController {
  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  TextEditingController moneyController = TextEditingController();
}
