// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key});

  @override
  State<Chat_Screen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chat_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.1,
          titleSpacing: 100.w,
          title: Text(
            'Chat',
            style: GoogleFonts.inter(
                fontSize: kSixteenFont, color: darkGrey, fontWeight: kFW600),
          ),
        ),
        body: Chat_list());
  }

  Widget Chat_list() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            Get.toNamed(KPersonal_chat);
          }),
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
            title: Text('Bharath',
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont,
                    color: darkGrey,
                    fontWeight: FontWeight.w500)),
            subtitle: Text('Requesting Room Rent for',
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
