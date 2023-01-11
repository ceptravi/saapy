// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';

class Add_acount extends StatefulWidget {
  const Add_acount({super.key});

  @override
  State<Add_acount> createState() => _Add_acountState();
}

class _Add_acountState extends State<Add_acount> {
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
          title: Text('Add Account',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: kFW600)),
        ),
        body: Column(
          children: [
            const Acount_components(),
            SizedBox(height: 120.h),
            Buttons(),
          ],
        ));
  }

  Widget Buttons() {
    return Container(
      margin: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40.h,
            width: 150.w,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                side: const BorderSide(width: 1, color: purple),
              ),
              onPressed: () {
                debugPrint('Received click');
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                    fontSize: kFourteenFont, color: purple, fontWeight: kFW500),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 40.h,
            width: 150.w,
            child: TextButton(
              onPressed: () {
                Get.toNamed(kDashboardPage);
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(color: purple)))),
              child: const Text("Add Beneficiary",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
