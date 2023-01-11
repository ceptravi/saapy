// ignore_for_file: camel_case_types, sized_box_for_whitespace

import '../../utils/export_file.dart';

class Transfer_view extends StatefulWidget {
  const Transfer_view({super.key});

  @override
  State<Transfer_view> createState() => _TransferviewState();
}

class _TransferviewState extends State<Transfer_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12.h),
        height: 140.h,
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
                  'Transfer Money',
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
        "name": "Scan & Pay",
        "image": "assets/images/Phone.png",
        "route": KQrcode
      },
      {
        "name": "Wallet to Bank",
        "image": "assets/images/bank.png",
        "route": KSelect_bank
      },
      {
        "name": "Self Transfer",
        "image": "assets/images/Pay.png",
        "route": KSelf_Tranfer
      },
      {
        "name": "Pay Phone Number",
        "image": "assets/images/Self.png",
        "route": KQrcode
      }
    ];
    return Container(
      height: 90.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: ((context, index) {
            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 12.w,
              children: [
                for (int i = 0; i < categories.length; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(categories[i]["route"]);
                        },
                        child: Image.asset(
                          categories[i]["image"],
                          width: 45.w,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Text(categories[i]["name"],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                fontSize: kTwelveFont,
                                color: darkGrey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
              ],
            );
          })),
    );
  }
}
