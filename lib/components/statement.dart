import 'package:moon_start_builders/controllers/wallet_controller.dart';

import '../../utils/export_file.dart';

class Statement_history extends StatefulWidget {
  const Statement_history({super.key});

  @override
  State<Statement_history> createState() => _StatementhistoryState();
}

class _StatementhistoryState extends State<Statement_history> {
  final WalletController controller = !Get.isRegistered<WalletController>()
      ? Get.put(WalletController())
      : Get.find<WalletController>();
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
        titleSpacing: 30.w,
        title: Text('Statement History',
            style: GoogleFonts.inter(
                fontSize: kEighteenFont, color: darkGrey, fontWeight: kFW600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History",
                    style: GoogleFonts.inter(
                        fontSize: kSixteenFont,
                        color: darkGrey,
                        fontWeight: kFW600),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          builder: (BuildContext context) {
                            return Filter_bottomsheet();
                          });
                    },
                    child: Row(
                      children: [
                        Text(
                          "Filter",
                          style: GoogleFonts.inter(
                              fontSize: kTwelveFont,
                              color: darkGrey,
                              fontWeight: kFW400),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Obx(() => controller.isLoading == false
                ? history_list()
                : CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget Filter_bottomsheet() {
    return SizedBox(
      height: 600.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.h, top: 10.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Filter",
                style: GoogleFonts.inter(
                  fontSize: kSixteenFont,
                  fontWeight: kFW600,
                  color: darkGrey,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.blue,
                  // fillColor: MaterialStateProperty.resolveWith(),
                  value: false, //isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      // var isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Last 6 months Transaction",
                  style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    fontWeight: kFW500,
                    color: darkGrey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(),
                  value: false, //isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      //var isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Last 3 months Transaction",
                  style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    fontWeight: kFW500,
                    color: darkGrey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(),
                  value: false, //isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      //var isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Last 1 months Transaction",
                  style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    fontWeight: kFW500,
                    color: darkGrey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Today",
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: kFW500,
                    color: darkGrey,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 250,
                  child: FlutterSlider(
                    jump: true,
                    values: const [10],
                    fixedValues: [
                      FlutterSliderFixedValue(percent: 0, value: ''),
                      FlutterSliderFixedValue(percent: 10, value: ''),
                      FlutterSliderFixedValue(percent: 20, value: ''),
                      FlutterSliderFixedValue(percent: 30, value: ''),
                      FlutterSliderFixedValue(percent: 40, value: ''),
                      FlutterSliderFixedValue(percent: 50, value: ''),
                      FlutterSliderFixedValue(percent: 60, value: ''),
                      FlutterSliderFixedValue(percent: 70, value: ''),
                      FlutterSliderFixedValue(percent: 80, value: ''),
                      FlutterSliderFixedValue(percent: 90, value: ''),
                      FlutterSliderFixedValue(percent: 100, value: ''),
                    ],
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      if (lowerValue is String) {
                        //  _lowerValue = double.parse(lowerValue);
                      } else {
                        // _lowerValue = lowerValue;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Text(
                  "1 Yearago",
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: kFW500,
                    color: darkGrey,
                  ),
                ),
              ],
            ),
            Grid_data(),
            Container(
              margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 100.w,
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
                        'Reset',
                        style: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            color: purple,
                            fontWeight: kFW500),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    // alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 4),
                    height: 35.h,
                    //padding: const EdgeInsets.only(left: 100, right: 100),
                    width: 100.w,
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                      onPressed: () {
                        // Get.toNamed();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(purple),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Grid_data() {
    List categories = [
      {
        "name": "Rechanges",
      },
      {
        "name": "Reservations",
      },
      {
        "name": "Credit Cards",
      },
      {
        "name": "Money Tranfer",
      },
      {
        "name": "Money Recevied",
      },
      {
        "name": "Add to wallet",
      },
    ];
    return SizedBox(
      height: 100.h,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (0.1 / 2.25),
            crossAxisCount: 3,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            return Row(
              children: [
                for (int i = 0; i < categories.length; i++)
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20.r, right: 20.r, top: 2.h, bottom: 2.h),
                      // height: 30.h,
                      // width: 250.w,
                      child: Text(categories[i]["name"],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: GoogleFonts.inter(
                              fontSize: kTwelveFont,
                              color: darkGrey,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
              ],
            );
          })),
    );
  }

  Widget history_list() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.myPassBookData.data!.all!.length,
        itemBuilder: ((context, index) {
          return Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5.h, right: 10.h),
            height: 104.h,
            width: double.infinity,
            margin: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                gradient: const LinearGradient(
                    colors: [kblue, kgreen],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20.h),
                        child:
                            Image.asset("assets/images/boy.png", height: 30.h)),
                    SizedBox(width: 10.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          child: Text(
                              controller
                                  .myPassBookData.data!.all![index]!.message!,
                              maxLines: 2,
                              style: GoogleFonts.inter(
                                  fontSize: kFourteenFont,
                                  color: darkGrey,
                                  fontWeight: kFW600)),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                            "Via ${controller.myPassBookData.data!.all![index]!.paymentModeId == 1 ? "Wallet" : "UPI"}",
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: darkGrey,
                                fontWeight: kFW500)),
                        SizedBox(height: 10.h),
                        Text(
                            "${controller.myPassBookData.data!.all![index]!.paymentDate!.day.toString()}th - ${controller.myPassBookData.data!.all![index]!.paymentDate!.month.toString()}- ${controller.myPassBookData.data!.all![index]!.paymentDate!.year.toString()}",
                            style: GoogleFonts.inter(
                                fontSize: kTenFont,
                                color: lightgrey,
                                fontWeight: kFW500)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('\u{20B9}',
                                style: GoogleFonts.inter(
                                    fontSize: kSixteenFont,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w300)),
                            SizedBox(width: 4.w),
                            Text(
                                controller
                                    .myPassBookData.data!.all![index]!.amount!,
                                style: GoogleFonts.inter(
                                    fontSize: kSixteenFont,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(height: 13.h),
                        Row(children: [
                          Image.asset("assets/images/done2.png", height: 20.h),
                          SizedBox(width: 7.w),
                          Text("Success",
                              style: GoogleFonts.inter(
                                  fontSize: kTenFont,
                                  color: darkGrey,
                                  fontWeight: kFW500))
                        ]),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }
}