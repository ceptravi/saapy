// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'dart:developer';
import 'dart:io';
import '../../utils/export_file.dart';

class QRView_Screen extends StatefulWidget {
  //QRView_Screen(keycode);
  // final Function keycode;

  // const QRView_Screen({Key? key, required this.keycode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QRView_Screen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.black87.withOpacity(0.1),
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: white,
              ))),
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            top: 60.h,
            left: 50.w,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('Place the QR Code inside the area',
                      style: GoogleFonts.inter(
                          fontSize: kFourteenFont,
                          color: white,
                          fontWeight: FontWeight.w600)),
                  Text('Scanning will Start automatically',
                      style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          color: white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 480.h,
            left: 80.w,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: GestureDetector(
                      onTap: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Image.asset(
                            'assets/images/torch.png',
                            width: 30.w,
                          );
                        },
                      )),
                ),
                Container(
                    height: 40.h,
                    width: 200.w,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(KTransfer);
                      },
                      child: Text(' Enter Mobile No',
                          style: GoogleFonts.inter(
                              fontSize: kFourteenFont,
                              color: white,
                              fontWeight: FontWeight.w500)),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 2,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        // controller.resumeCamera();
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
