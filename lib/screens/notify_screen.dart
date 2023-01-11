// ignore_for_file: camel_case_types

import '../utils/export_file.dart';

class Notification_view extends StatefulWidget {
  const Notification_view({super.key});

  @override
  State<Notification_view> createState() => _NotificationState();
}

class _NotificationState extends State<Notification_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        titleSpacing: 65,
        title: Text(
          "Notification",
          style: GoogleFonts.inter(
            letterSpacing: 1,
            fontSize: kEighteenFont,
            fontWeight: kFW600,
            color: darkGrey,
          ),
        ),
        leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: darkGrey,
                    )))),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
        //width: 250.w,
        height: 110.h,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.h),
                  child: Image.asset(
                    "assets/images/man1.png",
                    width: 47.w,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 220.w,
                  child: Text(
                    maxLines: 2,
                    "Vishnu is Requesting Room Rent for the month of Dec'2022",
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: darkGrey,
                        fontWeight: kFW600),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 35.h, bottom: 30.h),
                    child: Icon(
                      Icons.close,
                      size: 17.h,
                    )),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //width:220.w,
                  margin: EdgeInsets.only(left: 55.h, bottom: 30.h),
                  child: Text(
                    // maxLines:2,
                    "1 day ago",
                    style: GoogleFonts.inter(
                        fontSize: kTenFont,
                        color: lightgrey,
                        fontWeight: kFW500),
                  ),
                ),
                Container(
                  //alignment:Alignment.center,
                  margin: EdgeInsets.only(right: 10.w, left: 130.w),
                  height: 27.h,
                  width: 90.w,
                  child: TextButton(
                    onPressed: () {
                      //Get.toNamed(KAmountScrn);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(purple),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.r),
                                    side: const BorderSide(color: purple)))),
                    child: const Text("Pay Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: kFW600,
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
