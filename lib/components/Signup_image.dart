// ignore_for_file: camel_case_types, file_names

import 'package:moon_start_builders/controllers/login_controller.dart';

import '../../utils/export_file.dart';

class Signup_image extends StatefulWidget {
  const Signup_image({super.key});

  @override
  State<Signup_image> createState() => _SignupimageState();
}

class _SignupimageState extends State<Signup_image> {
    final LoginController controller = !Get.isRegistered<LoginController>()
      ? Get.put(LoginController())
      : Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, top: 35.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: darkGrey, size: 23.w)),
                  GestureDetector(
                    onTap: () {
                      controller.skipPressed(true);
                      Get.toNamed(kDashboardPage);
                    },
                    child: Text("skip",
                        style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            color: darkGrey,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
            width: double.infinity,
            height: 200.h,
            child: Image.asset(
              "assets/images/signup.png",
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
