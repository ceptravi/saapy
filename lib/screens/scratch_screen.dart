// ignore_for_file: camel_case_types
import '../utils/export_file.dart';

class Scratch_Screen extends StatefulWidget {
  const Scratch_Screen({super.key});

  @override
  State<Scratch_Screen> createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<Scratch_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        titleSpacing: 60.w,
        title: Text('Scratch Cards',
            style: GoogleFonts.inter(
                fontSize: kEighteenFont, color: darkGrey, fontWeight: kFW600)),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20.h, left: 20.h),
            child: Text(
              "Amount",
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  color: lightgrey,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 20.h),
            child: Row(
              children: [
                Text('\u{20B9}',
                    style: GoogleFonts.inter(
                        fontSize: kTwentyFourFont,
                        color: darkGrey,
                        fontWeight: FontWeight.w300)),
                SizedBox(width: 4.w),
                Text('15,065',
                    style: GoogleFonts.inter(
                        fontSize: kTwentyFourFont,
                        color: darkGrey,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30.h, left: 10.h),
              child: Text("My Rewards",
                  style: GoogleFonts.inter(
                      fontSize: kSixteenFont,
                      color: darkGrey,
                      fontWeight: kFW600))),
          Container(
            margin: EdgeInsets.all(10.r),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        builder: (BuildContext context) {
                          return Bottom_sheet();
                        });
                  },
                  child: Row(
                    children: [
                      Container(
                        // height: 250.h,
                        width: 160.w,
                        child: Image.asset(
                          'assets/images/blur1.png',
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                          width: 160.w,
                          child: Image.asset('assets/images/blur2.png')),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        builder: (BuildContext context) {
                          return Bottom_sheet();
                        });
                  },
                  child: Row(
                    children: [
                      Container(
                        // height: 250.h,
                        width: 160.w,
                        child: Image.asset(
                          'assets/images/blur2.png',
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                          width: 160.w,
                          child: Image.asset('assets/images/blur1.png')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Bottom_sheet() {
    return SizedBox(
      height: 350.h,
      child: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(top:5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Scratcher(
                      brushSize: 30,
                      threshold: 50,

                      // image: AssetImage("assets/images/blurone.png"),
                      //image: Image.asset('assets/images/blur2.png', width: 5.h),
                      color: const Color.fromARGB(255, 236, 187, 223),
                      onChange: (value) => print("Scratch progress: $value%"),
                      onThreshold: () => print("Threshold reached, you won!"),
                      child: Container(
                          height: 136.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            color: const Color.fromARGB(255, 236, 187, 223),
                          ),
                          child: Image.asset(
                            'assets/images/blur2.png',
                            height: 136.h,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),

                  // const SizedBox(height: 30),
                  // assets:
                  //   -images/foldergif.gif,
                ],
              ),
            ),
          ),
          SizedBox(height: 13.h),
          Text("Congrats Flat 50% OFF on Minimalist Skincare",
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  color: darkGrey,
                  fontWeight: kFW400)),
          SizedBox(height: 7.h),
          Text("Rewards Generated when Money Transferred",
              style: GoogleFonts.inter(
                  fontSize: kTenFont, color: darkGrey, fontWeight: kFW400)),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("to",
                  style: GoogleFonts.inter(
                      fontSize: kTenFont, color: darkGrey, fontWeight: kFW400)),
              SizedBox(width: 3.w),
              Text("Vishnu",
                  style: GoogleFonts.inter(
                      fontSize: kTenFont, color: darkGrey, fontWeight: kFW600)),
            ],
          ),
          SizedBox(height: 30),
          Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 4),
            height: 35.h,
            //padding: const EdgeInsets.only(left: 100, right: 100),
            width: 150.w,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TextButton(
              onPressed: () {
                // Get.toNamed();
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(color: purple)))),
              child: const Text("Redeem now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15)),
            ),
          ),
          SizedBox(height: 7.h),
          Text("Copy code and apply while checkout",
              style: GoogleFonts.inter(
                  fontSize: kTenFont, color: darkGrey, fontWeight: kFW400)),
        ],
      ),
    );
  }
}
