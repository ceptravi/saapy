// ignore_for_file: non_constant_identifier_names

import '../../utils/export_file.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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
          titleSpacing: 60.w,
          title: Text('Money Transfer',
              style: GoogleFonts.inter(
                  fontSize: kEighteenFont,
                  color: darkGrey,
                  fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            upi_search(),
            list_data(),
            proceed_button(),
          ],
        ));
  }

  Widget upi_search() {
    return Container(
      margin: EdgeInsets.all(13.r),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: Image.asset(
              'assets/images/contact.png',
            ),
            hintText: 'Enter UPI or Mobile No',
            hintStyle: GoogleFonts.inter(
                color: lightgrey, fontSize: kTwelveFont, fontWeight: kFW500)),
      ),
    );
  }

  Widget list_data() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return ListTile(
                leading: Image.asset('assets/images/profile.png'),
                title: Text('Bharath',
                    style: GoogleFonts.inter(
                        fontSize: kFourteenFont,
                        color: darkGrey,
                        fontWeight: FontWeight.w500)));
          })),
    );
  }

  Widget proceed_button() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 42.h,
        margin: EdgeInsets.only(left: 70.w, right: 70.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            'Proceed',
            style: GoogleFonts.inter(
                fontSize: kSixteenFont,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
