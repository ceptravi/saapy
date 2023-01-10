// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Login_view extends StatefulWidget {
  const Login_view({super.key});

  @override
  State<Login_view> createState() => _LoginviewState();
}

class _LoginviewState extends State<Login_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Signup_image(),
            Login_form(),
          ],
        ),
      ),
    );
  }
}
