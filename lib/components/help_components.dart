// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../utils/export_file.dart';

class Help_component extends StatefulWidget {
  const Help_component({super.key});

  @override
  State<Help_component> createState() => _HelpcomponentState();
}

class _HelpcomponentState extends State<Help_component> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Support_image(),
        Support_data(),
        SizedBox(
          height: 10.h,
        ),
        Support_list()
      ],
    );
  }

  Widget Support_image() {
    return Image.asset('assets/images/support.gif');
  }

  Widget Support_data() {
    return Column(
      children: [
        Text("How Can we help You ?",
            style: GoogleFonts.inter(
                fontSize: kTwentyFont,
                color: darkGrey,
                fontWeight: FontWeight.w700)),
        SizedBox(
          height: 10.h,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10.w),
          // width: 300.w,
          child: Text(
              "it looks likes You are experiencig problems with our this process. we are here to help so Please get in touch with us.",
              maxLines: 3,
              style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: lightgrey,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  Widget Support_list() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(KHelp);
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
                        "assets/images/Frame6.png",
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.r),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/chat1.png",
                              width: 45.w,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text('Chat with us',
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
                        "assets/images/Frame5.png",
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.r),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/callno.png",
                              width: 45.w,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text('Call No',
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
        GestureDetector(
          onTap: () {},
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: SizedBox(
              width: 154.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/Frame7.png",
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.r),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/email.png",
                          width: 45.w,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text('Email Us',
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
    );
  }
}
