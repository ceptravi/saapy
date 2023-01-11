// ignore_for_file: camel_case_types

import '../utils/export_file.dart';

class Own_Wallet extends StatefulWidget {
  const Own_Wallet({Key? key}) : super(key: key);

  @override
  State<Own_Wallet> createState() => _OwnWalletState();
}

class _OwnWalletState extends State<Own_Wallet> {
  // Our first view in viewport

  @override
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
          titleSpacing: 60.w,
          title: Text('SaanPay Wallet',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600)),
        ),
        body: const Wallet_view());
  }
}
