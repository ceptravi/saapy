// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../utils/export_file.dart';

class Coupons_view extends StatefulWidget {
  const Coupons_view({super.key});

  @override
  State<Coupons_view> createState() => _CouponsviewState();
}

class _CouponsviewState extends State<Coupons_view> {
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
          title: Text('Coupons',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600)),
        ),
        body: Stack(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/leaf.gif',
                  width: 100.w,
                )),
            ListView.builder(
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return Coupon_card();
                })),
          ],
        ));
  }

  Widget Coupon_card() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 0,
      child: Container(
          margin: EdgeInsets.all(6.r),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.r),
          height: 90.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  kblue,
                  kgreen,
                ],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "10%",
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: brown,
                        fontWeight: kFW700),
                  ),
                  Text(
                    "OFF",
                    style: GoogleFonts.inter(
                        fontSize: kTwentyFourFont,
                        color: brown,
                        fontWeight: kFW700),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "On Your next Payment",
                    style: GoogleFonts.inter(
                        fontSize: 13.sp, color: darkGrey, fontWeight: kFW700),
                  ),
                  Text(
                    "vaild till 23 Dec 2022",
                    style: GoogleFonts.inter(
                        fontSize: 11.sp, color: lightgrey, fontWeight: kFW700),
                  ),
                ],
              ),
              Container(
                // alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                width: 80.w,
                height: 30.h,

                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                  onPressed: () {
                    //Get.toNamed(kDashboardPage);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: const BorderSide(color: purple)))),
                  child: const Text("Apply",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                ),
              ),
            ],
          )),
    );
  }
}
