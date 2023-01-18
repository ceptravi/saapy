import 'dart:io';

import 'package:hive/hive.dart';
import 'package:moon_start_builders/utils/export_file.dart';
import 'package:path_provider/path_provider.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserSimplePreferences.init();
  await enableHive();
  openBox();
  runApp(const AppWidget());
}

var path = Directory.current.path;
late Box<String> tokenData;

enableHive() async {
  Directory doument = await getApplicationDocumentsDirectory();
  Hive
    ..init(doument.path)
    ..registerAdapter(StorageAdapter());
}

openBox() async {
  tokenData = await Hive.openBox('hiveToken');
  debugPrint("Hive box openned");
}

@HiveType(typeId: 1)
class Storage {
  Storage({required this.token});

  @HiveField(0)
  String token;
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
