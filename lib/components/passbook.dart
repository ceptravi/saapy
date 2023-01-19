// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';
import '../controllers/wallet_controller.dart';

class Passbook_view extends StatefulWidget {
  const Passbook_view({super.key});

  @override
  State<Passbook_view> createState() => _PassbookState();
}

class _PassbookState extends State<Passbook_view> {
  final WalletController controller = !Get.isRegistered<WalletController>()
      ? Get.put(WalletController())
      : Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "name": "Wallet",
        "image": "assets/images/wallet1.png",
        "route": KWallet
      },
      {
        "name": "Passbook & History",
        "image": "assets/images/passbook.png",
        "route": KPassbook_view
      },
      {
        "name": "My Orders",
        "image": "assets/images/passbook.png",
        "route": KMyorders
      },
      {
        "name": "Refer & Earn",
        "image": "assets/images/Earn.png",
        "route": KWallet
      },
    ];

    return SizedBox(
        height: 95.h,
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
                        InkWell(
                          onTap: () {
                            //categories[i]["image"][0]["wallet1"];
                            if (categories[i]["name"] ==
                                'Passbook & History') {
                              controller
                                  .buttonPressed(categories[i]["route"]);
                            }
                            Get.toNamed(categories[i]["route"]);
                          },
                          child: Image.asset(
                            categories[i]["image"],
                            width: 75.w,
                          ),
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        SizedBox(
                          width: 115.w,
                          child: Text(categories[i]["name"],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.inter(
                                  fontSize: kTwelveFont,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                ],
              );
            })));
  }
}
