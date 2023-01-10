// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import '../utils/export_file.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const Home_Screen(),
    const AllServiesScreen(),
    const Chat_Screen(),
    const Menu_Screen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home_Screen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 3,
        child: Image.asset(
          'assets/images/scan.png',
          width: 33.w,
        ),
        onPressed: () {
          Get.toNamed(KQrcode);
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 0,
          elevation: 0,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 5.w,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              const Home_Screen(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/home.png',
                            width: 20.w,
                            color: currentTab == 0 ? purple : grey,
                          ),
                          Text(
                            'Home',
                            style: GoogleFonts.inter(
                              fontSize: currentTab == 0 ? 13.sp : 11.sp,
                              fontWeight: currentTab == 0 ? kFW600 : kFW500,
                              color: currentTab == 0 ? purple : grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 3.w,
                    // ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              const AllServiesScreen(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          currentTab == 1
                              ? Image.asset('assets/images/dots.png',
                                  width: 23.w, color: purple)
                              : Image.asset(
                                  'assets/images/dot1.png',
                                  width: 18.w,
                                  color: grey,
                                ),
                          Text(
                            'All Services',
                            style: GoogleFonts.inter(
                              fontSize: currentTab == 1 ? 13.sp : 11.sp,
                              fontWeight: currentTab == 1 ? kFW600 : kFW500,
                              color: currentTab == 1 ? purple : grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              const Chat_Screen(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/chat.png',
                            width: 25.w,
                            color: currentTab == 2 ? purple : grey,
                          ),
                          Text(
                            'Chat',
                            style: GoogleFonts.inter(
                              fontSize: currentTab == 2 ? 13.sp : 11.sp,
                              fontWeight: currentTab == 2 ? kFW600 : kFW500,
                              color: currentTab == 2 ? purple : grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              const Menu_Screen(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          currentTab == 3
                              ? Image.asset(
                                  'assets/images/menu2.png',
                                  width: 20.w,
                                  color: purple,
                                )
                              : Image.asset(
                                  'assets/images/menu.png',
                                  width: 20.w,
                                  color: grey,
                                ),
                          Text(
                            'Menu',
                            style: GoogleFonts.inter(
                              fontSize: currentTab == 3 ? 13.sp : 11.sp,
                              fontWeight: currentTab == 3 ? kFW600 : kFW500,
                              color: currentTab == 3 ? purple : grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
