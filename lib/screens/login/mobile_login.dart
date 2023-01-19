// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../controllers/login_controller.dart';
import '../../utils/export_file.dart';

class Mobile_login extends StatefulWidget {
  const Mobile_login({super.key});

  @override
  State<Mobile_login> createState() => _MobileloginState();
}

class _MobileloginState extends State<Mobile_login> {
  final LoginController controller = !Get.isRegistered<LoginController>()
      ? Get.put(LoginController())
      : Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Signup_image(),
            Mobile_form(),
            const SizedBox(height: 170),
            Mobile_button(),
          ],
        ),
      ),
    );
  }

  Widget Mobile_form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15.h),
          child: Text(
            "Mobile Verificat",
            style: GoogleFonts.inter(
                fontSize: kTwentyFourFont,
                color: darkGrey,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 30.h),
        Container(
          margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: Column(
            children: [
              TextFormField(
                controller: controller.mobileController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  //prefixIcon:
                  //contentPadding:EdgeInsets.only(top:15),
                  //     Container(
                  //   margin: const EdgeInsets.only(top: 15),
                  //   child: Text(
                  //     "+91",
                  //     textAlign: TextAlign.center,
                  //     style: GoogleFonts.inter(
                  //         fontSize: kFourteenFont,
                  //         color: darkGrey,
                  //         fontWeight: FontWeight.w700),
                  //   ),
                  // ),
                  hintText: "Registered Email",
                  contentPadding: const EdgeInsets.only(top: 15),
                  hintStyle: GoogleFonts.inter(
                      fontSize: 11.sp,
                      color: lightgrey,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Mobile_button() {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5.h),
      height: 40.h,
      padding: EdgeInsets.only(left: 100.w, right: 100.w),
      width: double.infinity,
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: TextButton(
        onPressed: () async {
          bool isSentOtp =
              await controller.forgotPassword(controller.mobileController.text);
          if (isSentOtp) {
            Get.toNamed(KOTP_screen);
          }
        },
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll<Color>(purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: const BorderSide(color: purple)))),
        child: Text(
          "Send OTP",
          style: GoogleFonts.inter(
              fontSize: kFourteenFont,
              color: white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
