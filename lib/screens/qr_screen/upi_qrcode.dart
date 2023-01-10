// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class UPI_code extends StatefulWidget {
  const UPI_code({super.key});

  @override
  State<UPI_code> createState() => _UPIcodeState();
}

class _UPIcodeState extends State<UPI_code> {
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
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(12.r),
        child: Column(children: [
          profile(),
          Details(),
          SizedBox(
            height: 15.h,
          ),
          const Qr_generater(),
          SizedBox(
            height: 15.h,
          ),
          buttons(),
        ]),
      ),
    );
  }

  Widget profile() {
    return CircleAvatar(
      backgroundImage: const AssetImage(
        'assets/images/man2.png',
      ),
      backgroundColor: white,
      radius: 60.r,
    );
  }

  Widget Details() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text('Vishnu',
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w700)),
        Text('+91 821071199',
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 15.h,
        ),
        Text('Pay using SaanPy or any other UPI Apps',
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w500))
      ],
    );
  }

  Widget buttons() {
    return Column(
      children: [
        Text('Select Bank for QR Code',
            style: GoogleFonts.inter(
                fontSize: kTwelveFont,
                color: darkGrey,
                fontWeight: FontWeight.w500)),
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
                    'Print',
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
                      "Share QRcode",
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
