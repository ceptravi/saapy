// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../utils/export_file.dart';

class Referral_view extends StatefulWidget {
  const Referral_view({super.key});

  @override
  State<Referral_view> createState() => _Referralviewstate();
}

class _Referralviewstate extends State<Referral_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          toolbarHeight: 200, // Set this height
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invite friends to Saanpay",
                      style: GoogleFonts.inter(
                        fontSize: kEighteenFont,
                        fontWeight: kFW600,
                        color: darkGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Invite friends to Saanpay and get --- when your friend send there first payment they get ---",
                      maxLines: 2,
                      style: GoogleFonts.inter(
                        fontSize: kTwelveFont,
                        fontWeight: kFW400,
                        color: darkGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Referral code",
                          style: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW600,
                            color: grey,
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                          width: 240.w,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              hintText: "ASA34154845A",
                              hintStyle: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                fontWeight: kFW600,
                              ),
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 15),
                              suffixIcon: const Icon(Icons.copy, size: 17),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            upi_search(),
            invite_data(),
          ],
        ));
  }

  Widget upi_search() {
    return Container(
      margin: EdgeInsets.all(13.r),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: Container(
              //height: 2.h,
              //width: 2.w,
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/contact.png',
              ),
            ), //height:10.h,
            hintText: 'Mobile No',
            hintStyle: GoogleFonts.inter(
                color: lightgrey, fontSize: kTwelveFont, fontWeight: kFW500)),
      ),
    );
  }

  Widget invite_data() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return ListTile(
                leading: Image.asset('assets/images/profile.png'),
                trailing: SizedBox(
                  height: 20.h,
                  width: 70.w,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r))),
                    ),
                    onPressed: () {},
                    child: const Text('invite'),
                  ),
                ),
                title: Text('Bharath',
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: darkGrey,
                        fontWeight: FontWeight.w500)));
          })),
    );
  }
}
