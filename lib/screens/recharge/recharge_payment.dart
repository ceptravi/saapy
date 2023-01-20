// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../controllers/login_controller.dart';
import '../../controllers/recharge_controller.dart';
import '../../utils/export_file.dart';
import '../../gateway/home.dart' as paymentAPI;


class Recharge_payment extends StatefulWidget {
  const Recharge_payment({super.key});

  @override
  State<Recharge_payment> createState() => _RechargepaymentState();
}

class _RechargepaymentState extends State<Recharge_payment> {
  final RechargeController controller = !Get.isRegistered<RechargeController>()
      ? Get.put(RechargeController())
      : Get.find<RechargeController>();
  final LoginController loginController = !Get.isRegistered<LoginController>()
      ? Get.put(LoginController())
      : Get.find<LoginController>();
     
  var isChecked = false.obs;
  @override
  void initState() {
    loginController.getUserInfo();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Recharge_data(),
              SizedBox(
                height: 90.h,
              ),
              Recharge_money(),
              SizedBox(
                height: 40.h,
              ),
              Wallet_balance(),
              SizedBox(
                height: 10.h,
              ),
              proceed_button(),
            ]),
      ),
    );
  }

  Widget Recharge_data() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: Image.asset('assets/images/jio1.png'),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(" Vishnu",
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 5.h,
        ),
        Text("+91 821071199",
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 5.h,
        ),
        Text("Prepaid - Bihar jharkhand",
            style: GoogleFonts.inter(
                fontSize: kTenFont, color: purple, fontWeight: FontWeight.w600))
      ],
    );
  }

  Widget Recharge_money() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('\u{20B9}',
                style: GoogleFonts.inter(
                    fontSize: kTwelveFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w600)),
            Text('${controller.rechargePlan.rs}',
                style: GoogleFonts.inter(
                    fontSize: 40.sp,
                    color: darkGrey,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        Container(
            margin: EdgeInsets.all(12.h),
            padding: EdgeInsets.all(10.r),
            width: double.infinity,
            // height: 150.h,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data',
                            style: GoogleFonts.inter(
                                fontSize: kTenFont,
                                color: lightgrey,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('${controller.rechargePlan.desc}}',
                            maxLines: controller.rechargePlan.desc!
                                .split('\n')
                                .length,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: darkGrey,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text('Validity',
                    //         style: GoogleFonts.inter(
                    //             fontSize: kTenFont,
                    //             color: lightgrey,
                    //             fontWeight: FontWeight.w500)),
                    //     SizedBox(
                    //       height: 5.h,
                    //     ),
                    //     Text("252 Days (28 Days * 9 Cycles)",
                    //         style: GoogleFonts.inter(
                    //             fontSize: kTwelveFont,
                    //             color: darkGrey,
                    //             fontWeight: FontWeight.w600)),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 130.w,
                  height: 25.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      side: const BorderSide(width: 1, color: purple),
                    ),
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: Text(
                      'Change Plan',
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: purple,
                          fontWeight: kFW400),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget Wallet_balance() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() => Checkbox(
                    //overlayColor: purple,
                    checkColor: Colors.white,
                    value: isChecked.value,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked.value = value!;
                        debugPrint("value is $value");
                      });
                    },
                  )),
              Text(
                "Wallet Balance",
                style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  fontWeight: kFW500,
                  color: darkGrey,
                ),
              )
            ],
          ),
          Obx(() => loginController.isLoading == false
              ? Text('\u{20B9}${loginController.userInfo.data!.walletBalance}',
                  style: GoogleFonts.inter(
                      fontSize: kEighteenFont,
                      color: darkGrey,
                      fontWeight: FontWeight.w600))
              : CircularProgressIndicator()),
        ],
      ),
    );
  }

  Widget proceed_button() {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Apply Coupon',
            style: GoogleFonts.inter(
                fontSize: kTwelveFont,
                color: purple,
                fontWeight: FontWeight.w500),
          ),
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
          child: Container(
            height: 42.h,
            margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                )
              ],
            ),
            child: Center(
              child: Text(
                'Proceed',
                style: GoogleFonts.inter(
                    fontSize: kSixteenFont,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Bottom_sheet() {
    return Container(
      padding: EdgeInsets.all(10.r),
      height: 300.h,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Option for payment',
              style: GoogleFonts.inter(
                  fontSize: kSixteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
            isChecked.value == true
                ? Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/wallet2.png',
                              ),
                              Text(
                                'SaanPay Wallet',
                                style: GoogleFonts.inter(
                                    fontSize: kFourteenFont,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            "\u{20B9}${loginController.userInfo.data!.walletBalance}",
                            style: GoogleFonts.inter(
                                fontSize: kEighteenFont,
                                color: darkGrey,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: darkGrey,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: Container(
                        //height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [kblue, kgreen]),
                        ),
                        child: ExpansionTile(
                          leading: Image.asset(
                            "assets/images/bank3.png",
                            height: 20.h,
                          ),
                          title: Text(
                            'Bank of America',
                            style: GoogleFonts.inter(
                              fontSize: kFourteenFont,
                              fontWeight: kFW500,
                            ),
                          ),
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                              ),
                              child: ListTile(
                                title: Text('Swiss Bank'),
                                //subtitle: Text('child subtitle'),
                                trailing: Icon(Icons.chevron_right),
                                //leading:Text("ram")//Image.asset("assets/images/usa.png"),//Image.asset("assets/images/usa.png"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: ListTile(
                                title: Text('Indian Bank'),
                                //subtitle: Text('child subtitle'),
                                trailing: Icon(Icons.chevron_right),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Select Bank for Payment',
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  color: lightgrey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40.h,
            ),
            Pay_button(),
          ],
        ),
      ),
    );
  }

  Widget Pay_button() {
    return GestureDetector(
      onTap: () {
        controller.doRecharge(controller.numberController.text, 15,
            isChecked.value == true ? 1 : 2);
        // Get.toNamed(kDashboardPage);
      },
      child: Container(
        height: 42.h,
        margin: EdgeInsets.only(left: 80.w, right: 80.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
           child:  OutlinedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                            15.r,
                          ))),
                        ),
                         
                          onPressed: () {
                     paymentAPI.handleURLButtonPress(context, "KEYRESP123657234");
                    },
                        child: Text('Pay Now',
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: FontWeight.w500)),
                      ),

        ),
      ),
    );
  }
}
