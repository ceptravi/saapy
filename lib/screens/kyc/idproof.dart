// ignore_for_file: non_constant_identifier_names

import '../../utils/export_file.dart';

class IdProof extends StatefulWidget {
  const IdProof({super.key});

  @override
  State<IdProof> createState() => _MyIdProofState();
}

class _MyIdProofState extends State<IdProof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 190.h, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kblue, kgreen]),
          ),
          padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
          // color: Colors.orange,

          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_new))),
              SizedBox(height: 10.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload Your ID Proof for KYC Verification",
                    style: GoogleFonts.inter(
                      fontSize: kEighteenFont,
                      fontWeight: kFW600,
                      color: darkGrey,
                    ),
                  ),
                  Text(
                    "Upload your Adhaar Card,Voter Id,Pan Card,Passport Or Driving License for the Verification",
                    style: GoogleFonts.inter(
                      fontSize: kTwelveFont,
                      fontWeight: kFW400,
                      color: darkGrey,
                    ),
                  ), //Upload any 2 Documents For Verification
                  Row(
                    children: [
                      Text(
                        "Upload any",
                        style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          fontWeight: kFW400,
                          color: darkGrey,
                        ),
                      ),
                      Text(
                        " 2 Documents",
                        style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          fontWeight: kFW600,
                          color: darkGrey,
                        ),
                      ),
                      Text(
                        " For Verification",
                        style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          fontWeight: kFW400,
                          color: darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            KYC_Document(),
            SizedBox(height: 20.h),
            Select_Document(),
            const SizedBox(height: 40),
            Bottom_data(),
          ],
        ),
      ),
    );
  }

  Widget KYC_Document() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
              hintText: "Select Document",
              hintStyle: GoogleFonts.inter(
                fontSize: kFourteenFont,
                fontWeight: kFW600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Image.asset("assets/images/Frameone.png"),
            GestureDetector(
              onTap: () {
                // Get.toNamed(KIDP);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: 200,
                      margin: const EdgeInsets.only(left: 2, right: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Document No",
                          hintStyle: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        "Browse +",
                        style: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW600,
                            color: darkGrey),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget Select_Document() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
              hintText: "Select Document",
              hintStyle: GoogleFonts.inter(
                fontSize: kFourteenFont,
                fontWeight: kFW600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Image.asset("assets/images/Framethree.png"),
            GestureDetector(
              onTap: () {
                // Get.toNamed(KIDP);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: 200,
                      margin: const EdgeInsets.only(left: 2, right: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Document No",
                          hintStyle: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        "Browse +",
                        style: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW600,
                            color: darkGrey),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget Bottom_data() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 40.h,
      width: 150.w,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300.h,
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/folder.gif',
                          height: 130.h,
                        ),
                        const SizedBox(height: 30),
                        // assets:
                        //   -images/foldergif.gif,
                        Text(
                          "Document Uploaded Successfully",
                          style: GoogleFonts.inter(
                            fontSize: kFourteenFont,
                            fontWeight: kFW500,
                            color: darkGrey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Tap Outside to close",
                          style: GoogleFonts.inter(
                            fontSize: kTenFont,
                            fontWeight: kFW400,
                            color: lightgrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll<Color>(purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: const BorderSide(color: purple)))),
        child: Text(
          "Save",
          style: GoogleFonts.inter(
              fontSize: kFourteenFont, color: white, fontWeight: kFW600),
        ),
      ),
    );
  }
}
