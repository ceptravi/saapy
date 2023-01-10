// ignore_for_file: library_private_types_in_public_api

import '../utils/export_file.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 420.h,
                      child: Image.asset(
                        contents[i].image,
                        height: 390.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(contents[i].title,
                          style: GoogleFonts.inter(
                              fontSize: 26.sp,
                              color: darkGrey,
                              fontWeight: kFW700)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(contents[i].discription,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: kSixteenFont,
                              color: lightgrey,
                              fontWeight: kFW500)),
                    )
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Get.toNamed(KSign_up);
              }
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Container(
                height: 50.h,
                margin: EdgeInsets.only(
                  left: 80.w,
                  right: 80.w,
                ),
                width: double.infinity,
                child: Container(
                  height: 45.h,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h),
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
                      currentIndex == contents.length - 1 ? "SignUp" : "Next",
                      style: GoogleFonts.inter(
                          fontSize: kSixteenFont,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: currentIndex == contents.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a member ? ',
                            style: GoogleFonts.inter(
                                fontSize: kFourteenFont,
                                color: lightgrey,
                                fontWeight: FontWeight.w400)),
                        GestureDetector(
                          onTap: () => {Get.toNamed(KLogin)},
                          child: Text('Login',
                              style: GoogleFonts.inter(
                                  fontSize: kSixteenFont,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    )
                  : null),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: purple,
      ),
    );
  }
}
