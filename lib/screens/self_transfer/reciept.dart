// ignore_for_file: non_constant_identifier_names

import '../../controllers/wallet_controller.dart';
import '../../utils/export_file.dart';

class Recipet extends StatefulWidget {
  const Recipet({super.key});

  @override
  State<Recipet> createState() => _RecipetState();
}

class _RecipetState extends State<Recipet> {
  final WalletController controller = !Get.isRegistered<WalletController>()
      ? Get.put(WalletController())
      : Get.find<WalletController>();
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
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 13.h),
            Recipet_profile(),
            Recipet_Data(),
            Recipet_list(),
            Recipet_buttons(),
          ],
        ),
      ),
    );
  }

  Widget Recipet_Data() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Image.asset("assets/images/done2.png", height: 22.h),
                SizedBox(width: 7.w),
                Text("Completed",
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w600))
              ]),
              SizedBox(height: 10.h),
              Text("20 DEC 2022 08:12 PM",
                  style: GoogleFonts.inter(
                      fontSize: kTenFont,
                      color: lightgrey,
                      fontWeight: FontWeight.w600))
            ],
          ),
          Text('\u{20B9}${controller.addmoney.data!.amount}',
              style: GoogleFonts.inter(
                  fontSize: kTwentyFont,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget Recipet_profile() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 48, // Image radius
          backgroundImage: AssetImage('assets/images/man1.png'),
        ),
        const SizedBox(height: 10),
        Text("Vishnu",
            style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 5.h),
        Text("+91 821071199",
            style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget Recipet_list() {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: LinearGradient(colors: [
            Colors.lightBlue.withOpacity(0.2),
            Colors.green.withOpacity(0.2)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/images/listok.png", height: 22.h),
                const SizedBox(width: 10),
                Text(
                  "Receipt",
                  style: GoogleFonts.inter(
                      fontSize: kFourteenFont,
                      color: darkGrey,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text("To-Vishnu",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 5.h),
            Text("821071199@okicici",
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: lightgrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 13.h),
            Text("From-Toufique Alam",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 5.h),
            Text("toufiquealam@idfc",
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: lightgrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 13.h),
            Text("UPI Transaction ID",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text("925109698935",
                    style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 30.w),
                const Icon(
                  Icons.copy,
                  color: Color.fromARGB(255, 147, 155, 147),
                  size: 18.0,
                ),
              ],
            ),
            const SizedBox(height: 13),
            Text("Operator Transaction ID",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 5.h),
            Text("CICAgkDR6t-npoh",
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: lightgrey,
                    fontWeight: FontWeight.w500)),
          ]),
    );
  }

  Widget Recipet_buttons() {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: Text(
            "Payment may take upto 3 working days to be reflected in your account.",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.inter(
                fontSize: kTenFont,
                color: lightgrey,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140.w,
                height: 35.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: const BorderSide(width: 1, color: purple),
                  ),
                  onPressed: () {
                    debugPrint('Received click');
                  },
                  child: Text(
                    'Help & Support',
                    style: GoogleFonts.inter(
                        fontSize: kTwelveFont,
                        color: purple,
                        fontWeight: kFW400),
                  ),
                ),
              ),
              SizedBox(
                width: 140.w,
                height: 35.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: const BorderSide(width: 1, color: purple),
                  ),
                  onPressed: () {
                    debugPrint('Received click');
                  },
                  child: Row(children: [
                    const Icon(
                      Icons.share,
                      color: purple,
                      size: 16.0,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      "Share Receipt",
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: purple,
                          fontWeight: kFW400),
                    ),
                  ]),
                ),
              ),
              //SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}
