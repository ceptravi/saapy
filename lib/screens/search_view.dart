import '../utils/export_file.dart';

class Search_view extends StatefulWidget {
  const Search_view({super.key});

  @override
  State<Search_view> createState() => _SearchviewState();
}

class _SearchviewState extends State<Search_view> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(13.r),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Image.asset(
                      'assets/images/filter.png',
                      width: 10,
                    ),
                    hintText: 'Search Anything',
                    hintStyle: GoogleFonts.inter(
                        color: lightgrey,
                        fontSize: kTwelveFont,
                        fontWeight: kFW500)),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recharge",
                        style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: lightgrey,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.close),
                    ],
                  ),
                );
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 40.h),
              child: Text(
                "Recently Paid",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: kFW600),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    //width: 250.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        //color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hari",
                              style: GoogleFonts.inter(
                                  fontSize: kFourteenFont,
                                  color: darkGrey,
                                  fontWeight: kFW600),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Paid",
                                  style: GoogleFonts.inter(
                                      fontSize: 11.sp,
                                      color: darkGrey,
                                      fontWeight: kFW600),
                                ),
                                SizedBox(width: 5.h),
                                Text(
                                  "\u{20B9}${1202}",
                                  style: GoogleFonts.inter(
                                      fontSize: kTwelveFont,
                                      color: darkGrey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          //alignment:Alignment.center,
                          margin: EdgeInsets.only(right: 10.h, left: 90.h),
                          height: 27.h,
                          width: 90.w,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        purple),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        side:
                                            const BorderSide(color: purple)))),
                            child: const Text("Pay Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: kFW600,
                                    fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
