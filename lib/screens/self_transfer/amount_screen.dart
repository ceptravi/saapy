// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Amount_Screen extends StatefulWidget {
  const Amount_Screen({super.key});

  @override
  State<Amount_Screen> createState() => _Amount_ScreenState();
}

class _Amount_ScreenState extends State<Amount_Screen> {
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
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 60.h),
              height: 70.h,
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/images/man2.png',
                ),
                backgroundColor: white,
                radius: 60.r,
              )),
          SizedBox(height: 10.h),
          Text(
            "Vishnu",
            style: GoogleFonts.inter(
              fontSize: kFourteenFont,
              fontWeight: kFW700,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Self Transfer",
            style: GoogleFonts.inter(
              fontSize: kTwelveFont,
              fontWeight: kFW500,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.currency_rupee),
              Text(
                "0",
                style: GoogleFonts.inter(
                  fontSize: 40.sp,
                  fontWeight: kFW500,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Bank_deatils(),
          Transfer_button(),
        ],
      ),
    );
  }

  Widget Bank_deatils() {
    return Container(
      // alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20.h, left: 10.h, bottom: 10.h),
      height: 150.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
              colors: [kblue, kgreen],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      width: double.infinity,
      margin: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/bank2.png",
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'SBI',
                style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  fontWeight: kFW500,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "To",
            style: GoogleFonts.inter(
              fontSize: kTenFont,
              fontWeight: kFW500,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/bank3.png",
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'Bank of America',
                style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  fontWeight: kFW500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Transfer_button() {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "Add Bank Account +",
              style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                fontWeight: kFW500,
              ),
            )),
        SizedBox(height: 25.h),
        Center(
          child: Container(
            //alignment:Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            height: 40.h,
            width: 150.w,
            child: TextButton(
              onPressed: () {
                Get.toNamed(KPayment_done);
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(color: purple)))),
              child: const Text("Transfer Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15)),
            ),
          ),
        ),
      ],
    );
  }
}
