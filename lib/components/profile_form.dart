// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../utils/export_file.dart';

class profile_form extends StatefulWidget {
  const profile_form({super.key});

  @override
  State<profile_form> createState() => _profileformState();
}

class _profileformState extends State<profile_form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
      child: Column(
        children: [
          Edit_profile(),
          Text_form(),
          Gender(),
          SizedBox(height: 10.h),
          Approved(),
          password(),
          Save_button(),
        ],
      ),
    );
  }

  Widget Edit_profile() {
    return Center(
      child: CircleAvatar(
          radius: 48.r, // Image radius
          backgroundImage: const AssetImage('assets/images/man1.png')),
    );
  }

  Widget Text_form() {
    return Wrap(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Vishnu",
            contentPadding: const EdgeInsets.all(5),
            hintStyle: GoogleFonts.inter(
                fontSize: kTwelveFont, color: lightgrey, fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "vishnu@gmail.com",
            contentPadding: const EdgeInsets.all(5),
            hintStyle: GoogleFonts.inter(
                fontSize: kTwelveFont, color: lightgrey, fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.calendar_month),
            hintText: "12/10/2000",
            contentPadding: const EdgeInsets.only(left: 10, top: 15),
            hintStyle: GoogleFonts.inter(
                fontSize: kTwelveFont, color: lightgrey, fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "JNTU,Kukatpally,Hyderabad",
            contentPadding: const EdgeInsets.all(5),
            hintStyle: GoogleFonts.inter(
                fontSize: kTwelveFont, color: lightgrey, fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "+91 8210****96",
            contentPadding: const EdgeInsets.all(5),
            hintStyle: GoogleFonts.inter(
                fontSize: kTwelveFont, color: lightgrey, fontWeight: kFW400),
          ),
        ),
      ],
    );
  }

  Widget Gender() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "Gender",
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont, color: darkGrey, fontWeight: kFW600),
            )),
        Container(
          margin: EdgeInsets.only(top: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 2,
                child: Container(
                    height: 45,
                    width: 95,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: purple,
                    ),
                    child: Text(
                      "Male",
                      style: GoogleFonts.inter(
                          fontSize: 13.sp, color: white, fontWeight: kFW500),
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: Container(
                    height: 45,
                    width: 95,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                    ),
                    child: Text(
                      "Female",
                      style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: kFW500),
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: Container(
                    height: 45,
                    width: 95,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                    ),
                    child: Text(
                      "Other",
                      style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: kFW500),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Approved() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(KKyc);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 45.h,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "KYC Approved",
                    style: GoogleFonts.inter(
                        fontSize: kTwelveFont,
                        color: darkGrey,
                        fontWeight: kFW600),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Image.asset(
                    'assets/images/correct.png',
                    width: 20.w,
                  )
                ],
              ),
              Image.asset(
                'assets/images/file.png',
                width: 20.w,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 5, right: 5, top: 15.h),
        //margin: EdgeInsets.only(top: 20),
        height: 45.h,

        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(15)),
        //color: Colors.blue,
        child: Text(
          "Change Password",
          style: GoogleFonts.inter(
              fontSize: kTwelveFont, color: darkGrey, fontWeight: kFW600),
        ),
      ),
    );
  }

  Widget Save_button() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 40.h,
      width: 150.w,
      child: TextButton(
        onPressed: () {
          Get.toNamed(KRecipet);
        },
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll<Color>(purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: const BorderSide(color: purple)))),
        child: Text(
          "Save",
          style: GoogleFonts.inter(
              fontSize: kFourteenFont, color: white, fontWeight: kFW600),
        ),
      ),
    );
  }
}
