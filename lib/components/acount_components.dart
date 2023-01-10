// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Acount_components extends StatefulWidget {
  const Acount_components({super.key});

  @override
  State<Acount_components> createState() => _AcountcomponentsState();
}

class _AcountcomponentsState extends State<Acount_components> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15.h, left: 20.h, right: 20.h),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Full Name",
                // prefixIcon: Icon(Icons.search,size: 25,),
                hintStyle: GoogleFonts.inter(
                  fontSize: kTwelveFont,
                  fontWeight: kFW500,
                  color: lightgrey,
                ),
              ),
            )),
        Container(
            margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 15.h),
            child: TextField(
              decoration: InputDecoration(
                suffix: SizedBox(
                  height: 25.h,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        15.r,
                      ))),
                    ),
                    onPressed: () {
                      // Get.toNamed();
                    },
                    child: Text('Change Bank',
                        style: GoogleFonts.inter(
                            fontSize: kTwelveFont,
                            color: purple,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                hintText: "SBI",
                prefixIcon: Image.asset(
                  "assets/images/bank2.png",
                  width: 25.w,
                ),
                hintStyle: GoogleFonts.inter(
                  fontSize: kTwelveFont,
                  fontWeight: kFW500,
                  color: lightgrey,
                ),
              ),
            )),
        Container(
            margin: EdgeInsets.only(top: 15.h, left: 20.h, right: 20.h),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Account No",
                // prefixIcon: Icon(Icons.search,size: 25,),
                hintStyle: GoogleFonts.inter(
                  fontSize: kTwelveFont,
                  fontWeight: kFW500,
                  color: lightgrey,
                ),
              ),
            )),
        Container(
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "IFSC Code",
                // prefixIcon: Icon(Icons.search,size: 25,),
                hintStyle: GoogleFonts.inter(
                  fontSize: kTwelveFont,
                  fontWeight: kFW500,
                  color: lightgrey,
                ),
              ),
            )),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50.h, left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saved Banks",
                style: GoogleFonts.inter(
                  fontSize: kSixteenFont,
                  fontWeight: kFW600,
                  color: darkGrey,
                ),
              ),
              SizedBox(
                height: 25.h,
                width: 80.w,
                child: OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      15.r,
                    ))),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        builder: (BuildContext context) {
                          return Bottom_sheet();
                        });
                  },
                  child: Text('View all',
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: purple,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
        List_data(),
      ],
    );
  }

  Widget List_data() {
    return Container(
        padding: EdgeInsets.all(10.r),
        // color: darkblue,
        height: 80.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  width: 200.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/bank.png",
                        width: 47.w,
                      ),
                      SizedBox(width: 6.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abhinaav Kumaar",
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: darkGrey,
                                fontWeight: kFW500),
                          ),
                          Text(
                            "Ac-4541*******",
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: darkGrey,
                                fontWeight: kFW500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })));
  }

  Widget Bottom_sheet() {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.h),
            alignment: Alignment.centerLeft,
            //color: lightgrey,
            //height: 20.h,
            child: Text(
              "Beneficiaries",
              style: GoogleFonts.inter(
                fontSize: kSixteenFont,
                fontWeight: kFW600,
                color: darkGrey,
              ),
            ),
          ),

          // assets:
          //   -images/foldergif.gif,
          Container(
              padding: EdgeInsets.all(10.r),
              // color: darkblue,
              height: 260.h,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/bank.png",
                                    width: 35.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Abhinaav Kumaar",
                                        style: GoogleFonts.inter(
                                            fontSize: kTwelveFont,
                                            color: darkGrey,
                                            fontWeight: kFW500),
                                      ),
                                      Text(
                                        "Ac-4541*******",
                                        style: GoogleFonts.inter(
                                            fontSize: kTwelveFont,
                                            color: darkGrey,
                                            fontWeight: kFW500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/note.png",
                                    width: 25.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Image.asset(
                                    "assets/images/del.png",
                                    width: 25.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }))),
        ],
      ),
    );
  }
}
