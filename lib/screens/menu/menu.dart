// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Menu_Screen extends StatefulWidget {
  const Menu_Screen({super.key});

  @override
  State<Menu_Screen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<Menu_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: white,
          // leading: InkWell(
          //     onTap: () {
          //       Get.back();
          //     },
          //     child: const Icon(
          //       Icons.arrow_back_ios_rounded,
          //       color: darkGrey,
          //     )),
          //titleSpacing: 100.w,
          title: Center(
            child: Text('Menu',
                style: GoogleFonts.inter(
                    fontSize: kEighteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        body: const Menu_Component());
  }
}
