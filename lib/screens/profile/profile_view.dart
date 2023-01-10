import 'package:moon_start_builders/utils/export_file.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: Text('Edit Profile',
            style: GoogleFonts.inter(
                fontSize: kEighteenFont,
                color: darkGrey,
                fontWeight: FontWeight.w600)),
      ),
      body: const SingleChildScrollView(child: profile_form()),
    );
  }
}
