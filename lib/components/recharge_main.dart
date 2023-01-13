// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/export_file.dart';
import '../controllers/recharge_controller.dart';

class Recharge_view extends StatefulWidget {
  const Recharge_view({super.key});

  @override
  State<Recharge_view> createState() => _RechargeviewState();
}

class _RechargeviewState extends State<Recharge_view> {
  final RechargeController controller = !Get.isRegistered<RechargeController>()
      ? Get.put(RechargeController())
      : Get.find<RechargeController>();
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
        "categoryName": "PrePaid",
        "type": 1,
        "image": "assets/images/mobile.png",
        "route": KRecharge
      },
      {
        "name": "Post-Paid Rechange",
        "categoryName": "PostPaid",
        "type": 0,
        "image": "assets/images/PostPaid.png",
        "route": KRecharge
      },
      {
        "name": "Electricity Bills",
        "categoryName": "Electricity",
        "type": 1,
        "image": "assets/images/bill.png",
        "route": KRecharge
      },
      {
        "name": "Fastag",
        "categoryName": "FASTAG",
        "type": 1,
        "image": "assets/images/Fastag.png",
        "route": KRecharge
      },
      {
        "name": "Loan Repayment",
        "categoryName": "Insurance",
        "type": 1,
        "image": "assets/images/homelone.png",
        "route": KRecharge
      },
      {
        "name": "Credit-Card Bills",
        "categoryName": "Insurance",
        "type": 1,
        "image": "assets/images/CreditCard.png",
        "route": KRecharge
      },
      {
        "name": "GogglePlay Rechange",
        "categoryName": "DataCard",
        "type": 1,
        "image": "assets/images/Googleplay.png",
        "route": KRecharge
      },
      {
        "name": "DTH",
        "categoryName": "DTH",
        "type": 1,
        "image": "assets/images/DTH.png",
        "route": KRecharge
      },
      {
        "name": "Landline",
        "categoryName": "Landline",
        "type": 1,
        "image": "assets/images/landline.png",
        "route": KRecharge
      },
      {
        "name": "Broadband",
        "categoryName": "DataCard",
        "type": 1,
        "image": "assets/images/broadband.png",
        "route": KRecharge
      },
      {
        "name": "Cable Tv",
        "categoryName": "DTH",
        "type": 1,
        "image": "assets/images/tv.png",
        "route": KRecharge
      },
      {
        "name": "Insurance",
        "categoryName": "Insurance",
        "type": 1,
        "image": "assets/images/Insurance.png",
        "route": KRecharge
      },
      {
        "name": "Subscriptions",
        "categoryName": "PostPaid",
        "type": 0,
        "image": "assets/images/sub.png",
        "route": KRecharge
      },
      {
        "name": "LPG Booking",
        "categoryName": "PostPaid",
        "type": 0,
        "image": "assets/images/LPG.png",
        "route": KRecharge
      },
      {
        "name": "Water Bill",
        "categoryName": "PostPaid",
        "type": 0,
        "image": "assets/images/Water.png",
        "route": KRecharge
      },
      {
        "name": "School Fees",
        "categoryName": "PostPaid",
        "type": 0,
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
                  onTap: () async {
                    // Get.toNamed(categories[i]["route"]);
                    // if (categories[i]["name"] == 'Pre-Paid Rechange') {
                    bool canOpen = await controller.callingProviderCategory(
                        categories[i]["categoryName"],
                        categories[i]["type"],
                        categories[i]["route"]);
                    if (canOpen) {
                      Get.toNamed(categories[i]["route"]);
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Try Again',
                        backgroundColor: Colors.grey,
                      );
                    }

                    // } else {
                    //   Get.toNamed(categories[i]["route"]);
                    // }
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
