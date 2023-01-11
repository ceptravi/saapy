import 'package:moon_start_builders/utils/export_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserSimplePreferences.init();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            title: 'SaanPay',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Satoshi',
            ),
            getPages: Routes.routes,
            initialRoute: kSplashPage);
      },
    );
  }
}
