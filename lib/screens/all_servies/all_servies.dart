import 'package:moon_start_builders/components/resevations.dart';
import 'package:moon_start_builders/components/rewards_screen.dart';

import '../../utils/export_file.dart';

class AllServiesScreen extends StatefulWidget {
  const AllServiesScreen({super.key});

  @override
  State<AllServiesScreen> createState() => _AllServiesScreenState();
}

class _AllServiesScreenState extends State<AllServiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const Custom_Appbar(),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
          const Banner_view(),
          SizedBox(
            height: 10.h,
          ),
          const Transfer_view(),
          SizedBox(
            height: 10.h,
          ),
          const Recharge_view(),
          SizedBox(
            height: 10.h,
          ),
          const Sub_Banner(),
          SizedBox(
            height: 10.h,
          ),
          const Credit_cards(),
          SizedBox(
            height: 6.h,
          ),
          const Rewards_screens(),
          SizedBox(
            height: 6.h,
          ),
          const Resevations_screens(),
          SizedBox(
            height: 25.h,
          ),
        ]))));
  }
}
