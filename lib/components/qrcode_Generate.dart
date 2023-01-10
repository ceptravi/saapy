// ignore_for_file: camel_case_types, file_names

import '../../utils/export_file.dart';

class Qr_generater extends StatefulWidget {
  const Qr_generater({super.key});

  @override
  State<Qr_generater> createState() => _QrgeneraterState();
}

class _QrgeneraterState extends State<Qr_generater> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "821071199",
      version: QrVersions.auto,
      size: 180.h,
    );
  }
}
