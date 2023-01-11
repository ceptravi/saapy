// ignore_for_file: camel_case_types

import '../../components/resevations.dart';
import '../../utils/export_file.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Screen> {
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
          const Passbook_view(),
          SizedBox(
            height: 10.h,
          ),
          const Recharge_view(),
          SizedBox(
            height: 10.h,
          ),
          const Banner_view(),
          SizedBox(
            height: 15.h,
          ),
          const Peoples_screens(),
          SizedBox(
            height: 6.h,
          ),
          const Resevations_screens(),
          const Text('data')
        ]))));
  }
}
