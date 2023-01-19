// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../../utils/export_file.dart';
import '../controllers/recharge_controller.dart';

class Recaharge_tab extends StatefulWidget {
  const Recaharge_tab({super.key});

  @override
  State<Recaharge_tab> createState() => _RecahargetabState();
}

class _RecahargetabState extends State<Recaharge_tab> {
  final RechargeController controller = !Get.isRegistered<RechargeController>()
      ? Get.put(RechargeController())
      : Get.find<RechargeController>();

  /// List of Tab Bar Item
  List<String> items = [
    "Polpular",
    "Sports",
    "Annual Planes",
    "Data Add On",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100.w,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          // SizedBox(
          //   width: double.infinity,
          //   height: 60,
          //   child: ListView.builder(
          //       physics: const BouncingScrollPhysics(),
          //       itemCount: items.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (ctx, index) {
          //         return Column(
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 setState(() {
          //                   current = index;
          //                 });
          //               },
          //               child: AnimatedContainer(
          //                 duration: const Duration(milliseconds: 300),
          //                 margin: EdgeInsets.all(3.r),
          //                 padding: EdgeInsets.only(
          //                     left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
          //                 height: 30.h,
          //                 decoration: BoxDecoration(
          //                     color: current == index ? purple : Colors.white54,
          //                     borderRadius: current == index
          //                         ? BorderRadius.circular(13.r)
          //                         : BorderRadius.circular(13.r),
          //                     border: current == index
          //                         ? Border.all(color: purple, width: 2)
          //                         : Border.all(color: purple, width: 1)),
          //                 child: Center(
          //                   child: Text(
          //                     items[index],
          //                     style: GoogleFonts.inter(
          //                         fontWeight: FontWeight.w500,
          //                         color: current == index ? white : purple),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             // Visibility(
          //             //     visible: current == index,
          //             //     child: Container(
          //             //       width: 5,
          //             //       height: 5,
          //             //       decoration: const BoxDecoration(
          //             //           color: purple, shape: BoxShape.circle),
          //             //     ))
          //           ],
          //         );
          //       }),
          // ),

          /// MAIN BODY
          Obx(() => controller.isLoading == true
              ? CircularProgressIndicator()
              : Package_tab()),
        ],
      ),
    );
  }

  Widget Package_tab() {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
          itemCount: controller.rechargePlans.data!.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                controller
                    .storeRechargePlan(controller.rechargePlans.data![index]);
                Get.toNamed(KRecharge_Payment);
              },
              child: Container(
                  margin: EdgeInsets.all(12.h),
                  padding: EdgeInsets.all(10.r),
                  width: double.infinity,
                  height: 188.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          kblue,
                          kgreen,
                        ],
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Data',
                              style: GoogleFonts.inter(
                                  fontSize: kTenFont,
                                  color: lightgrey,
                                  fontWeight: FontWeight.w500)),
                          Text('plans',
                              style: GoogleFonts.inter(
                                  fontSize: kTenFont,
                                  color: lightgrey,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Container(child: Text(
                          //   '${controller.rechargePlans.data![index]!.desc}',
                          //   style: GoogleFonts.inter(
                          //       fontSize: kFourteenFont,
                          //       color: darkGrey,
                          //       fontWeight: FontWeight.w600),
                          //   maxLines: 2,
                          // ),),
                          Text(
                              '\u{20B9}${controller.rechargePlans.data![index]!.rs!}',
                              style: GoogleFonts.inter(
                                  fontSize: kFourteenFont,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(" Validity",
                          style: GoogleFonts.inter(
                              fontSize: kFourteenFont,
                              color: lightgrey,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 3.h,
                      ),
                      // Text(
                      //     '${controller.rechargePlans.data![index]!.desc.toString().split('\n')[0].contains('Data') ? controller.rechargePlans.data![index]!.desc.toString().split('\n')[3] : controller.rechargePlans.data![index]!.desc.toString().split('\n')[4]}',
                      //     style: GoogleFonts.inter(
                      //         fontSize: kFourteenFont,
                      //         color: darkGrey,
                      //         fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                          " ${controller.rechargePlans.data![index]!.desc.toString()}",
                          style: GoogleFonts.inter(
                              fontSize: kTenFont,
                              color: lightgrey,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: white),
                            child: Text('New Year Special plans ',
                                style: GoogleFonts.inter(
                                    fontSize: kTwelveFont,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ],
                  )),
            );
          })),
    );
  }
}
