import '../utils/export_file.dart';

class AddMoneyController extends GetxController {
  final Rxn<bool> _isSkipped = Rxn<bool>();
  bool get isSkipped => _isSkipped.value ?? false;

  final Rxn<bool> _isLoading = Rxn<bool>();
  bool get isLoading => _isLoading.value ?? false;

  final Rxn<int> _uid = Rxn<int>();
  int get uid => _uid.value ?? 0;

  TextEditingController moneyController = TextEditingController();

  void skipPressed(bool isSkipped) {
    _isSkipped(isSkipped);
  }
}
