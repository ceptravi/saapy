// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Recharge_view extends StatefulWidget {
  const Recharge_view({super.key});

  @override
  State<Recharge_view> createState() => _RechargeviewState();
}

class _RechargeviewState extends State<Recharge_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12.h),
        // height: 140.h,
        width: double.infinity,
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
        child: Container(
          padding: EdgeInsets.only(left: 5.h, top: 5.h, right: 5.h),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.h, top: 5.h),
                child: Text(
                  'Recharge & Bills',
                  style: GoogleFonts.inter(
                      fontSize: kFourteenFont,
                      color: darkGrey,
                      fontWeight: kFW600),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Recharge(),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ));
  }

  Widget Recharge() {
    List categories = [
      {
        "name": "Pre-Paid Rechange",
        "image": "assets/images/mobile.png",
        "route": KRecharge
      },
      {
        "name": "Post-Paid Rechange",
        "image": "assets/images/PostPaid.png",
        "route": KRecharge
      },
      {
        "name": "Electricity Bills",
        "image": "assets/images/bill.png",
        "route": KRecharge
      },
      {
        "name": "Fastag",
        "image": "assets/images/Fastag.png",
        "route": KRecharge
      },
      {
        "name": "Loan Repayment",
        "image": "assets/images/homelone.png",
        "route": KRecharge
      },
      {
        "name": "Credit-Card Bills",
        "image": "assets/images/CreditCard.png",
        "route": KRecharge
      },
      {
        "name": "GogglePlay Rechange",
        "image": "assets/images/Googleplay.png",
        "route": KRecharge
      },
      {"name": "DTH", "image": "assets/images/DTH.png", "route": KRecharge},
      {
        "name": "Landline",
        "image": "assets/images/landline.png",
        "route": KRecharge
      },
      {
        "name": "Broadband",
        "image": "assets/images/broadband.png",
        "route": KRecharge
      },
      {"name": "Cable Tv", "image": "assets/images/tv.png", "route": KRecharge},
      {
        "name": "Insurance",
        "image": "assets/images/Insurance.png",
        "route": KRecharge
      },
      {
        "name": "Subscriptions",
        "image": "assets/images/sub.png",
        "route": KRecharge
      },
      {
        "name": "LPG Booking",
        "image": "assets/images/LPG.png",
        "route": KRecharge
      },
      {
        "name": "Water Bill",
        "image": "assets/images/Water.png",
        "route": KRecharge
      },
      {
        "name": "School Fees",
        "image": "assets/images/School.png",
        "route": KRecharge
      }
    ];
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 12.w,
        children: [
          for (int i = 0; i < categories.length; i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(categories[i]["route"]);
                  },
                  child: Image.asset(
                    categories[i]["image"],
                    width: 45.w,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 70.w,
                  child: Text(categories[i]["name"],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 35.h,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
