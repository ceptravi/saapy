// ignore_for_file: camel_case_types
import '../utils/export_file.dart';

class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              // Get.toNamed(KProfile);
              Get.toNamed(KUPI_Qr);
            },
            //onTap: () => Get.toNamed(KUPI_Qr),
            child: CircleAvatar(
              radius: 40.r,
              backgroundImage: const AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          titleSpacing: 0,
          title: Wrap(
            // spacing: 0,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saan Pay',
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: darkGrey,
                        fontWeight: kFW600),
                  ),
                  Row(
                    children: [
                      Text(
                        'UPI ID-rickey786@icici.in ',
                        style: GoogleFonts.inter(
                            fontSize: kTenFont,
                            color: darkGrey,
                            fontWeight: kFW500),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(
                        'assets/images/copy.png',
                        width: 15.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(KSearch);
                  },
                  child: Image.asset(
                    'assets/images/search.png',
                    width: 20.w,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/gift.png',
                    width: 27.w,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(KNotify);
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bell.png',
                        width: 19.w,
                      ),
                      Positioned(
                          left: 10.r,
                          top: 2.h,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
