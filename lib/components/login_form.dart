// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../controllers/login_controller.dart';
import '../utils/export_file.dart';

class Login_form extends StatefulWidget {
  const Login_form({super.key});

  @override
  State<Login_form> createState() => _LoginformState();
}

class _LoginformState extends State<Login_form> {
  final LoginController controller = !Get.isRegistered<LoginController>()
      ? Get.put(LoginController())
      : Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form_data(),
        SizedBox(height: 80.h),
        Login_button(),
      ],
    );
  }

  Widget Form_data() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 20),
          child: const Text(
            "Login",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 71, 68, 68)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: Column(
            children: [
              TextFormField(
                controller: controller.fullNameController,
                decoration: InputDecoration(
                    hintText: "Email/Phone",
                    contentPadding: const EdgeInsets.all(5),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.only(left: 10, top: 15),
                    hintStyle: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("ForgetPassword?",
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: darkGrey,
                          fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Get.toNamed(KMobile_Screen);
                    // controller.forgotPassword();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Login_button() {
    return Column(
      children: [
        Container(
          // alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 5),
          height: 40.h,
          padding: const EdgeInsets.only(left: 100, right: 100),
          width: double.infinity,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Obx(() => controller.isLoading == false
              ? TextButton(
                  onPressed: () async {
                    debugPrint("Login Pressed");
                    bool isLoggedin = await controller.login(
                        context,
                        controller.passwordController.text,
                        controller.fullNameController.text,
                        "rest");
                    if (isLoggedin) {
                      Get.toNamed(kDashboardPage);
                    } else {
                      debugPrint("LoginFailed");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: const BorderSide(color: purple)))),
                  child: const Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                )
              : CircularProgressIndicator()),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: const Text(
              "Or",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )),
        Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    "assets/images/google.png",
                  )),
              SizedBox(width: 8.w),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                  "assets/images/fb.png",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
