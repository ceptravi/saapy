// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Resevations_screens extends StatefulWidget {
  const Resevations_screens({super.key});

  @override
  State<Resevations_screens> createState() => _ResevationsState();
}

class _ResevationsState extends State<Resevations_screens> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12.h),
        // height: 140.h,
        width: double.infinity,
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
        child: Container(
          padding: EdgeInsets.only(left: 5.h, top: 5.h, right: 5.h),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.h, top: 5.h),
                child: Text(
                  'Resevations',
                  style: GoogleFonts.inter(
                      fontSize: kFourteenFont,
                      color: darkGrey,
                      fontWeight: kFW600),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              transfer(),
            ],
          ),
        ));
  }

  Widget transfer() {
    List categories = [
      {
        "name": "Bus",
        "image": "assets/images/Bus.png",
      },
      {
        "name": "Flight",
        "image": "assets/images/Flight.png",
      },
      {
        "name": "Holiday",
        "image": "assets/images/Holiday.png",
      },
      {
        "name": "Hotels",
        "image": "assets/images/Hotels.png",
      },
      {
        "name": "train",
        "image": "assets/images/train.png",
      }
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
                  width: 45.w,
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
                          fontSize: 13.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
