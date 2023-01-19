// ignore_for_file: non_constant_identifier_names

import '../../controllers/recharge_controller.dart';
import '../../utils/export_file.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Recharge extends StatefulWidget {
  const Recharge({super.key});

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  final RechargeController controller = !Get.isRegistered<RechargeController>()
      ? Get.put(RechargeController())
      : Get.find<RechargeController>();
  @override
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: white,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: darkGrey,
              )),
          titleSpacing: 75.w,
          title: Text('Recharge',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            upi_search(),
            list_data(),
          ],
        ));
  }

  Widget upi_search() {
    return Container(
      margin: EdgeInsets.all(13.r),
      child: TextFormField(
        controller: controller.numberController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: Image.asset(
              'assets/images/contact.png',
            ),
            hintText: 'Enter UPI or Mobile No',
            hintStyle: GoogleFonts.inter(
                color: lightgrey, fontSize: kTwelveFont, fontWeight: kFW500)),
      ),
    );
  }

  Widget list_data() {
    return Expanded(
      child: ListView.builder(
          itemCount: _contacts!.length,
          itemBuilder: ((context, index) {
            return ListTile(
                leading: Image.asset('assets/images/profile.png'),
                trailing: SizedBox(
                  height: 25.h,
                  //width: 70.w,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        15.r,
                      ))),
                    ),
                    onPressed: () {
                      // controller.numberController.text = _contacts[index].
                      Get.toNamed(KPaid_Recharge);
                    },
                    child: Text('Recharge',
                        style: GoogleFonts.inter(
                            fontSize: kTwelveFont,
                            color: purple,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                title: Text(_contacts![index].displayName,
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: darkGrey,
                        fontWeight: FontWeight.w500)));
          })),
    );
  }
}
