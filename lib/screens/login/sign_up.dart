// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _SignupState();
}

class _SignupState extends State<Sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Signup_image(),
            Signup_form(),
          ],
        ),
      ),
    );
  }
}
