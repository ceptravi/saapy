// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, camel_case_types

import '../../utils/export_file.dart';

class Kyc_screen extends StatefulWidget {
  const Kyc_screen({super.key});

  @override
  State<Kyc_screen> createState() => _KycscreenState();
}

class _KycscreenState extends State<Kyc_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 150.h,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kblue, kgreen]),
          ),
          padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_new))),
              SizedBox(height: 10.h),
              Text(
                "Select a method to complete your full KYC for free",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: kFW600,
                  color: darkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          Nearby_KYC(),
          SizedBox(height: 15.h),
          Add_Document(),
        ],
      ),
    );
  }

  Widget Nearby_KYC() {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(KTransferOne);
      },
      child: Stack(
        children: [
          Image.asset("assets/images/Frametwo.png"),
          Container(
            margin: const EdgeInsets.only(top: 35),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/kycshop.png",
                  height: 40,
                ),
                const SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Look For nearby KYC Shop",
                      style: GoogleFonts.inter(
                          fontSize: kFourteenFont,
                          fontWeight: kFW600,
                          color: darkGrey),
                    ),
                    const SizedBox(height: 5),
                    Container(
                        width: 250.w,
                        child: Text(
                          "This will redirect you to nearby KYC Shop for your convenience.",
                          maxLines: 3,
                          style: GoogleFonts.inter(
                              fontSize: kTwelveFont,
                              fontWeight: kFW400,
                              color: darkGrey),
                        ))
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Add_Document() {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(KId_proof);
      }),
      child: Stack(
        children: [
          Image.asset("assets/images/Frameone.png"),
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/slip.png",
                  height: 40,
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Add your Documents +",
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        fontWeight: kFW600,
                        color: darkGrey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
