// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Skipmenu extends StatefulWidget {
  const Skipmenu({super.key});

  @override
  State<Skipmenu> createState() => _SkipmenuState();
}

class _SkipmenuState extends State<Skipmenu> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Skip_Profile(),
          Skip_wallet(),
          menu_skip(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget Skip_Profile() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(shape: BoxShape.circle),

            // radius: 48, // Image radius
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: white,
              child: Image.asset('assets/images/man1.png'),
            )),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User",
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text(
                  "UPI ID - r*******@icici.in",
                  style: GoogleFonts.inter(
                      fontSize: kTenFont,
                      color: lightgrey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.copy,
                    color: const Color.fromARGB(255, 147, 155, 147),
                    size: 15.w),
              ],
            ),
            Text(
              "My QR Code",
              style: GoogleFonts.inter(
                  fontSize: kTenFont,
                  color: lightgrey,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ]),
    );
  }

  Widget Skip_wallet() {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MY Wallet",
            style: GoogleFonts.inter(
                fontSize: kFourteenFont,
                color: lightgrey,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('\u{20B9}',
                      style: GoogleFonts.inter(
                          fontSize: kEighteenFont,
                          color: darkGrey,
                          fontWeight: FontWeight.w700)),
                  Text('0',
                      style: GoogleFonts.inter(
                          fontSize: kEighteenFont,
                          color: darkGrey,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(KLogin);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Add Money',
                        style: GoogleFonts.inter(
                            fontSize: kTwelveFont,
                            color: white,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.add),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget menu_skip() {
    List categories = [
      {
        "name": "Edit profile",
        "image": "assets/images/edit.png",
        "route": KLogin
      },
      {
        "name": "Privacy & Security",
        "image": "assets/images/lock.png",
        "route": KLogin
      },
      {
        "name": "Offers & Rewards",
        "image": "assets/images/offers.png",
        "route": KLogin
      },
      {"name": "KYC", "image": "assets/images/kyc.png", "route": KKyc},
      {"name": "Help", "image": "assets/images/help.png", "route": KSupport},
      {
        "name": "Refund Policy",
        "image": "assets/images/policy.png",
        "route": KLogin
      },
      {
        "name": "Terms & Conditions",
        "image": "assets/images/terms.png",
        "route": KLogin
      },
      {
        "name": "Setting",
        "image": "assets/images/setting.png",
        "route": KQrcode
      },
      {
        "name": "Contact Us",
        "image": "assets/images/contact1.png",
        "route": KLogin
      },
      {"name": "About US", "image": "assets/images/info.png", "route": KLogin},
      {"name": "LogIn", "image": "assets/images/login.png", "route": KLogin},
    ];
    return Column(
      children: [
        for (int i = 0; i < categories.length; i++)
          GestureDetector(
            onTap: () {
              Get.toNamed(KLogin);
            },
            child: ListTile(
              title: Text(categories[i]["name"],
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: GoogleFonts.inter(
                      fontSize: kTwelveFont,
                      color: darkGrey,
                      fontWeight: FontWeight.w500)),
              leading: Image.asset(
                categories[i]["image"],
                width: 25.w,
              ),
            ),
          ),
      ],
    );
  }
}