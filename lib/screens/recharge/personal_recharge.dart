// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Personal_recharge extends StatefulWidget {
  const Personal_recharge({super.key});

  @override
  State<Personal_recharge> createState() => _PersonalrechargeState();
}

class _PersonalrechargeState extends State<Personal_recharge> {
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
        titleSpacing: 90.w,
        title: Text('Vishnu',
            style: GoogleFonts.inter(
                fontSize: kEighteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Package_search(),
          const Recaharge_tab(),
        ],
      ),
    );
  }

  Widget Package_search() {
    return Container(
      margin: EdgeInsets.all(13.r),
      child: TextFormField(
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
}
