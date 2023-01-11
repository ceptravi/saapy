// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../utils/export_file.dart';

class Paid_Recharge extends StatefulWidget {
  const Paid_Recharge({super.key});

  @override
  State<Paid_Recharge> createState() => _PaidRechargeState();
}

class _PaidRechargeState extends State<Paid_Recharge> {
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
          titleSpacing: 80.w,
          title: Text('Pre-Paid',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            upi_search(),
            Recharge_list(),
            SizedBox(
              height: 250.h,
            ),
            proceed_button(),
          ],
        ));
  }

  Widget upi_search() {
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

  Widget Recharge_list() {
    List categories = [
      {"name": "Airtel", "image": "assets/images/airtel.png", "route": KQrcode},
      {"name": "JIo", "image": "assets/images/Jio.png", "route": KProfile},
      {
        "name": "Vodafone",
        "image": "assets/images/Vodafone.png",
        "route": KQrcode
      },
      {"name": "Bsnl", "image": "assets/images/Bsnl.png", "route": KQrcode}
    ];
    return Column(
      children: [
        for (int i = 0; i < categories.length; i++)
          GestureDetector(
            onTap: () {
              //Get.toNamed(categories[i]["route"]);
            },
            child: ListTile(
              title: Text(categories[i]["name"],
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: GoogleFonts.inter(
                      fontSize: kTwelveFont,
                      color: darkGrey,
                      fontWeight: FontWeight.w500)),
              leading: Image.asset(
                categories[i]["image"],
                width: 30.w,
              ),
            ),
          ),
      ],
    );
  }

  Widget proceed_button() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(KPersonal_Recharge);
      },
      child: Container(
        height: 42.h,
        margin: EdgeInsets.only(left: 80.w, right: 80.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            'Proceed',
            style: GoogleFonts.inter(
                fontSize: kSixteenFont,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
