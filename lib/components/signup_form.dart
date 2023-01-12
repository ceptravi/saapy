// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../utils/export_file.dart';
import '../controllers/signUp-controller.dart';

class Signup_form extends StatefulWidget {
  const Signup_form({super.key});

  @override
  State<Signup_form> createState() => _SignupformState();
}

class _SignupformState extends State<Signup_form> {
  final SignUpController controller = !Get.isRegistered<SignUpController>()
      ? Get.put(SignUpController())
      : Get.find<SignUpController>();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 10),
          child: Text(
            "Sign Up",
            style: GoogleFonts.inter(
                fontSize: kTwentyFourFont,
                color: darkGrey,
                fontWeight: FontWeight.w700),
          ),
        ),
        Form(),
        Signup_button(),
      ],
    );
  }

  Widget Form() {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    contentPadding: const EdgeInsets.all(5),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "Email ID",
                    contentPadding: const EdgeInsets.all(5),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.only(left: 10, top: 15),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: controller.mobileController,
                  decoration: InputDecoration(
                    hintText: "Mobile No",
                    contentPadding: const EdgeInsets.all(5),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: controller.referralController,
                  decoration: InputDecoration(
                    hintText: "Referral Code(Optional)",
                    contentPadding: const EdgeInsets.all(5),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: lightgrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 12, left: 10, right: 10),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              Text(
                "By Accepting this you agreed all the Terms & Conditions",
                style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    color: lightgrey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Signup_button() {
    return Column(
      children: [
        Container(
          // alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 5),
          height: 40.h,
          padding: const EdgeInsets.only(left: 100, right: 100),
          width: double.infinity,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: TextButton(
            onPressed: () async {
              bool isUpdated = await controller.registerAccount(
                  context,
                  controller.nameController.text,
                  controller.passwordController.text,
                  controller.emailController.text,
                  controller.mobileController.text,
                  "Fcm_token",
                  controller.referralController.text);
              if (isUpdated) {
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
              "Sign Up",
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  color: white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 6.h),
            alignment: Alignment.center,
            child: Text(
              "Or",
              style: GoogleFonts.inter(
                  fontSize: kFourteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600),
            )),
        GestureDetector(
          onTap: () {
            Get.toNamed(KMobile_Screen);
          },
          child: Container(
              margin: EdgeInsets.only(top: 6.h),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Login With",
                    style: GoogleFonts.inter(
                        letterSpacing: 1,
                        fontSize: 13.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "Mob No",
                    style: GoogleFonts.inter(
                        letterSpacing: 2,
                        fontSize: 13.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
