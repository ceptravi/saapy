// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Payment_done extends StatefulWidget {
  const Payment_done({super.key});

  @override
  State<Payment_done> createState() => _PaymentdoneState();
}

class _PaymentdoneState extends State<Payment_done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: darkGrey,
            )),
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Image.asset(
                "assets/images/payment_done.gif",
                height: 240.h,
              )),
          SizedBox(height: 40.h),
          Text(
            "Payment Done",
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: kFW700,
              color: darkGrey,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Amount Transferred Succesfully to Vishnu",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: kFW400,
              color: darkGrey,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "of",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: kFW400,
                  color: darkGrey,
                ),
              ),
              SizedBox(width: 5.h),
              Icon(Icons.currency_rupee, size: 15.sp),
              Text(
                "15,065",
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: kFW600,
                  color: darkGrey,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              Get.toNamed(KRecipet);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  gradient: const LinearGradient(
                      colors: [kgreen, kblue],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
              //color: lightgrey,
              width: double.infinity,
              height: 60.h,
              margin: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/listok.png", height: 22.h),
                  Text(
                    "Transaction Receipt",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: kFW500,
                      color: darkGrey,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 20.sp),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Center(
            child: Container(
              //alignment:Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              height: 40.h,
              width: 170.w,
              child: TextButton(
                onPressed: () {
                  //Get.toNamed(KSuccesscrn);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(color: purple)))),
                child: const Text("Back to home",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
