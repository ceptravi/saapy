// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../utils/export_file.dart';

class Select_bank extends StatefulWidget {
  const Select_bank({super.key});

  @override
  State<Select_bank> createState() => _Select_bankState();
}

class _Select_bankState extends State<Select_bank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          toolbarHeight: 100.h, // Set this height
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [kblue, kgreen]),
            ),
            padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
            // color: Colors.orange,

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Bank to Add",
                        style: GoogleFonts.inter(
                          letterSpacing: 1,
                          fontSize: kEighteenFont,
                          fontWeight: kFW600,
                          color: darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Bank Name",
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                  hintStyle: GoogleFonts.inter(
                    fontSize: kTwelveFont,
                    fontWeight: kFW500,
                    color: lightgrey,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular Banks",
                style: GoogleFonts.inter(
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  color: darkGrey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12.h, right: 12.h),
              padding: EdgeInsets.only(left: 5.h, right: 5.h),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  popular_bank(),
                  All_bank(),
                ],
              ),
            )
          ]),
        ));
  }

  Widget popular_bank() {
    List categories = [
      {
        "name": "Union",
        "image": "assets/images/un.png",
      },
      {
        "name": "Kotak",
        "image": "assets/images/un.png",
      },
      {
        "name": "ICICI",
        "image": "assets/images/un.png",
      },
      {
        "name": "BOI",
        "image": "assets/images/un.png",
      },
      {
        "name": "PNB",
        "image": "assets/images/un.png",
      },
      {
        "name": "Axis",
        "image": "assets/images/un.png",
      },
      {
        "name": "Canara",
        "image": "assets/images/un.png",
      },
      {
        "name": "BOB",
        "image": "assets/images/un.png",
      },
    ];
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 12.w,
        children: [
          for (int i = 0; i < categories.length; i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  categories[i]["image"],
                  width: 30.w,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 70.w,
                  child: Text(categories[i]["name"],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: darkGrey,
                          fontWeight: kFW400)),
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget All_bank() {
    List categories = [
      {
        "name": "SBI",
        "image": "assets/images/bank2.png",
        "route": kAdd_acount,
      },
      {
        "name": "Union Bank",
        "image": "assets/images/un.png",
        "route": kAdd_acount,
      },
      {"name": "SBI", "image": "assets/images/bank3.png", "route": kAdd_acount},
      {
        "name": "Bank of America",
        "image": "assets/images/un.png",
        "route": kAdd_acount
      },
      {
        "name": "Union Bank",
        "image": "assets/images/bank2.png",
        "route": kAdd_acount
      },
      {
        "name": "Bank of America",
        "image": "assets/images/bank3.png",
        "route": kAdd_acount
      },
      {
        "name": "Union Bank",
        "image": "assets/images/un.png",
        "route": kAdd_acount
      },
      {"name": "SBI", "image": "assets/images/bank2.png", "route": kAdd_acount},
    ];
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 12.w,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "All Other Banks",
              style: GoogleFonts.inter(
                fontSize: kSixteenFont,
                fontWeight: kFW500,
                color: darkGrey,
              ),
            ),
          ),
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(categories[i]["route"]);
                      },
                      child: Image.asset(
                        categories[i]["image"],
                        width: 30.w,
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.h, top: 5.h),
                    alignment: Alignment.centerLeft,
                    child: Text(categories[i]["name"],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.inter(
                            fontSize: kTwelveFont,
                            color: darkGrey,
                            fontWeight: kFW600)),
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
