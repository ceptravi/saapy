import 'package:moon_start_builders/utils/export_file.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
      body: const Help_component(),
    );
  }
}
