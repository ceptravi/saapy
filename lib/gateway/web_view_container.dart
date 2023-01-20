import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
import 'atom_pay_helper.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final resHashKey;
  WebViewContainer(this.url, this.resHashKey);
  @override
  createState() => _WebViewContainerState(this.url, this.resHashKey);
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _url;
  final _resHashKey;
  final _key = UniqueKey();
  late WebViewController _controller;
  _WebViewContainerState(this._url, this._resHashKey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 2,
        ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              initialUrl: _url,
              onPageFinished: (String url) async {
                if (url.contains('/mobilesdk/param')) {
                  print("get return url");
                  print(url);
                  String separator = "?";
                  int sepPos = url.indexOf(separator);
                  if (sepPos == -1) {
                    //print("No ? found in url...!");
                  }
                  var substringfromurl =
                      url.substring(sepPos + separator.length);
                  List responseArray = [];
                  var responseMap = {};

                  var urlarray =
                      substringfromurl.split('&').map((text) => text).toList();

                  for (var i = 0; i < urlarray.length; i++) {
                    if (urlarray[i].isNotEmpty && urlarray[i].length > 2) {
                      var splitNewResponse = urlarray[i]
                          .trim()
                          .split('=')
                          .map((text) => text)
                          .toList();
                      responseArray.add(splitNewResponse);
                    }
                  }

                  for (var i = 0; i < responseArray.length; i++) {
                    responseMap[responseArray[i][0]] = responseArray[i][1];
                  }

                  print("Final response = ");
                  print(responseMap);

                  //calling validateSignature function from atom_pay_helper file
                  var checkFinalTransaction =
                      validateSignature(responseMap, _resHashKey);

                  var transactionResult = "";

                  print("checkFinalTransaction result");
                  print(checkFinalTransaction);

                  if (checkFinalTransaction) {
                    if (responseMap['f_code'] == 'Ok') {
                      transactionResult = "success";
                    } else if (responseMap['f_code'] == 'C') {
                      transactionResult = "cancelled by user";
                    } else {
                      transactionResult = "failed";
                    }
                  } else {
                    // ignore: avoid_print
                    print("signature mismatched");
                    transactionResult = "failed";
                  }

                  // // ignore: use_build_context_synchronously
                  Navigator.pop(context); // Close current window
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Transaction Status = $transactionResult")));
                }
              },
              gestureNavigationEnabled: true,
            ))
          ],
        ));
  }
}
