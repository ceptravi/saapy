// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Peoples_screens extends StatefulWidget {
  const Peoples_screens({super.key});

  @override
  State<Peoples_screens> createState() => _PeoplesState();
}

class _PeoplesState extends State<Peoples_screens> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12.h),
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
                  'Peoples',
                  style: GoogleFonts.inter(
                      fontSize: kFourteenFont,
                      color: darkGrey,
                      fontWeight: kFW600),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Recent_data(),
            ],
          ),
        ));
  }

  Widget Recent_data() {
    List categories = [
      {
        "name": "Siri",
        "image": "assets/images/female.png",
      },
      {
        "name": "Arvind",
        "image": "assets/images/man1.png",
      },
      {
        "name": "priya",
        "image": "assets/images/female.png",
      },
      {
        "name": "Vishnu",
        "image": "assets/images/old.png",
      },
      {
        "name": "Srinivas",
        "image": "assets/images/man1.png",
      },
      {
        "name": "Divya",
        "image": "assets/images/female.png",
      },
      {
        "name": "Hari",
        "image": "assets/images/old.png",
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
                CircleAvatar(
                  radius: 28.r,
                  backgroundImage: AssetImage(
                    categories[i]["image"],
                  ),
                  backgroundColor: Colors.transparent,
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
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
          Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Image.asset('assets/images/more.png'),
              Text('More',
                  style: GoogleFonts.inter(
                      fontSize: kTwelveFont,
                      color: darkGrey,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
