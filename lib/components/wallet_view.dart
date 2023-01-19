// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/login_controller.dart';
import '../controllers/wallet_controller.dart';
import '../utils/export_file.dart';

class Wallet_view extends StatefulWidget {
  const Wallet_view({Key? key}) : super(key: key);

  @override
  State<Wallet_view> createState() => _WalletviewState();
}

class _WalletviewState extends State<Wallet_view> {
  // Our first view in viewport
  final WalletController controller = !Get.isRegistered<WalletController>()
      ? Get.put(WalletController())
      : Get.find<WalletController>();
  final LoginController loginController = !Get.isRegistered<LoginController>()
      ? Get.put(LoginController())
      : Get.find<LoginController>();
  @override
  void initState() {
    // TODO: implement initState
    loginController.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(14.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Balance',
                  style: GoogleFonts.inter(
                      fontSize: kFourteenFont,
                      color: lightgrey,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => loginController.isLoading == false
                    ? Row(
                        children: [
                          Text('\u{20B9}',
                              style: GoogleFonts.inter(
                                  fontSize: kTwentyFourFont,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w300)),
                          Text(
                              '${loginController.userInfo.data!.walletBalance}',
                              style: GoogleFonts.inter(
                                  fontSize: kTwentyFourFont,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )
                    : CircularProgressIndicator(),
              ),
              wallet_card(),
            ],
          ),
        ),
        Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/images/leaf.gif',
              width: 100.w,
            )),
      ],
    );
  }

  Widget wallet_card() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 12.w,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setLoadingFalse();
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        builder: (BuildContext context) {
                          // UDE : SizedBox instead of Container for whitespaces
                          return Bottom_card();
                        },
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        width: 154.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Frame1.png",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4.r),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Add_wallet.png",
                                    width: 50.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('Add Money to Wallet',
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            color: darkGrey,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        width: 154.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Frame2.png",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8.r),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/bank.png",
                                    width: 45.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('SendMoney to Bank',
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            color: darkGrey,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(KStatement);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        width: 154.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Frame3.png",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4.r),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/statement.png",
                                    width: 50.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('Request Statement',
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            color: darkGrey,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.buttonPressed(KPassbook_view);
                      // Get.toNamed(KPassbook_view);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        width: 154.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Frame4.png",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4.r),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/phonebook.png",
                                    width: 50.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('Passbook',
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            color: darkGrey,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.myCardsPressed(KScratch);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        width: 154.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Frame3.png",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4.r),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/statement.png",
                                    width: 50.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('My SCratch Cards',
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            color: darkGrey,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 6.w,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     controller.buttonPressed(KPassbook_view);
                  //     // Get.toNamed(KPassbook_view);
                  //   },
                  //   child: Card(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     elevation: 3,
                  //     child: SizedBox(
                  //       width: 154.w,
                  //       child: Stack(
                  //         alignment: Alignment.center,
                  //         children: [
                  //           Image.asset(
                  //             "assets/images/Frame4.png",
                  //           ),
                  //           Container(
                  //             padding: EdgeInsets.only(left: 4.r),
                  //             child: Row(
                  //               children: [
                  //                 Image.asset(
                  //                   "assets/images/phonebook.png",
                  //                   width: 50.w,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 100.w,
                  //                   child: Text('Passbook',
                  //                       maxLines: 2,
                  //                       style: GoogleFonts.inter(
                  //                           fontSize: 13.sp,
                  //                           color: darkGrey,
                  //                           fontWeight: FontWeight.w500)),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Bottom_card() {
    return SizedBox(
      height: 270.h,
      child: Container(
        padding: EdgeInsets.all(12.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Add Money',
                maxLines: 2,
                style: GoogleFonts.inter(
                    fontSize: kSixteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: controller.addMoneyController,
              decoration: InputDecoration(
                hintText: "1000",
                contentPadding: const EdgeInsets.only(left: 5, top: 10),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Text('\u{20B9}',
                      style: GoogleFonts.inter(
                          fontSize: kFourteenFont,
                          color: darkGrey,
                          fontWeight: FontWeight.w600)),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Text('Apply coupon',
                      style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          color: purple,
                          fontWeight: FontWeight.w500)),
                ),
                hintStyle: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: lightgrey,
                    fontWeight: kFW600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Payment(),
            SizedBox(
              height: 20.h,
            ),
            Center(child: Save_button()),
          ],
        ),
      ),
    );
  }

  Widget Save_button() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 40.h,
      width: 150.w,
      child: Obx(() => controller.isLoading == true
          ? SizedBox(
              width: 5.w,
              child: const CircularProgressIndicator(),
            )
          : TextButton(
              onPressed: () async {
                bool isAdded = await controller.addMoney(
                    controller.addMoneyController.text, "test");
                if (isAdded) {
                  Get.toNamed(KRecipet);
                } else {
                  Fluttertoast.showToast(
                    msg: 'Try Again',
                    backgroundColor: Colors.grey,
                  );
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(color: purple)))),
              child: Text(
                "Prossed & Add",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont, color: white, fontWeight: kFW600),
              ),
            )),
    );
  }

  Widget Payment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          // width: 140.w,
          height: 35.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              side: const BorderSide(width: 1, color: purple),
            ),
            onPressed: () {},
            child: Row(children: [
              const Icon(
                Icons.add,
                color: purple,
                size: 16.0,
              ),
              SizedBox(width: 3.w),
              Text(
                ('\u{20B9}${100}'),
                style: GoogleFonts.inter(
                    fontSize: kTwelveFont, color: purple, fontWeight: kFW400),
              ),
            ]),
          ),
        ),
        SizedBox(
          // width: 140.w,
          height: 35.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              side: const BorderSide(width: 1, color: purple),
            ),
            onPressed: () {},
            child: Row(children: [
              const Icon(
                Icons.add,
                color: purple,
                size: 16.0,
              ),
              SizedBox(width: 3.w),
              Text(
                ('\u{20B9}${200}'),
                style: GoogleFonts.inter(
                    fontSize: kTwelveFont, color: purple, fontWeight: kFW400),
              ),
            ]),
          ),
        ),
        SizedBox(
          // width: 140.w,
          height: 35.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              side: const BorderSide(width: 1, color: purple),
            ),
            onPressed: () {},
            child: Row(children: [
              const Icon(
                Icons.add,
                color: purple,
                size: 16.0,
              ),
              SizedBox(width: 3.w),
              Text(
                ('\u{20B9}${500}'),
                style: GoogleFonts.inter(
                    fontSize: kTwelveFont, color: purple, fontWeight: kFW400),
              ),
            ]),
          ),
        ),
        SizedBox(
          // width: 140.w,
          height: 35.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              side: const BorderSide(width: 1, color: purple),
            ),
            onPressed: () {},
            child: Row(children: [
              const Icon(
                Icons.add,
                color: purple,
                size: 16.0,
              ),
              SizedBox(width: 3.w),
              Text(
                ('\u{20B9}${1000}'),
                style: GoogleFonts.inter(
                    fontSize: kTwelveFont, color: purple, fontWeight: kFW400),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
