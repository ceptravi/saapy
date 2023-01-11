// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:moon_start_builders/utils/export_file.dart';

class support_list extends StatefulWidget {
  const support_list({super.key});

  @override
  State<support_list> createState() => _supportlistState();
}

class _supportlistState extends State<support_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: darkGrey,
            )),
        titleSpacing: 75.w,
        title: Text('Help & Support',
            style: GoogleFonts.inter(
                fontSize: kEighteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w600)),
      ),
      body: help_list(),
    );
  }

  Widget help_list() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {}),
          child: ListTile(
            leading: Stack(
              children: [
                Image.asset(
                  'assets/images/man1.png',
                  width: 50.w,
                ),
                const Positioned(
                  top: 0,
                  right: 285,
                  child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: null), //CircularAvatar
                ), //Positioned
              ],
            ), //Posit
            //  Image.asset('assets/images/man1.png'),
            title: Text('SaanPay',
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            subtitle: Text('Facing issue while transferring money',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: kTenFont,
                    color: lightgrey,
                    fontWeight: FontWeight.w500)),
            trailing: Text('1 day ago ',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: kTenFont,
                    color: lightgrey,
                    fontWeight: FontWeight.w500)),
          ),
        );
      }),
    );
  }
}
