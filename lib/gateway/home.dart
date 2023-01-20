import 'package:flutter/material.dart';
import 'web_view_container.dart';
import 'atom_pay_helper.dart';

// to test uat try below
const String login = "192"; //mandatory
const String pass = 'Test@123'; //mandatory
const String prodid = 'NSE'; //mandatory
const String requesthashKey = 'KEY123657234'; //mandatory
const String responsehashKey = 'KEYRESP123657234'; //mandatory
const String requestEncryptionKey =
    '8E41C78439831010F81F61C344B7BFC7'; //mandatory
const String responseDecryptionKey =
    '8E41C78439831010F81F61C344B7BFC7'; //mandatory

const String amt = '1.00'; //mandatory
const String username = 'Siddu'; //optional
const String mobile = '9985091823'; //optional
const String email = 'test@gmail.com'; //optional
const String address = 'mumbai'; //optional
const String date =
    '12/06/2022 16:50:00'; //mandatory //current transaction date should be matching like this

const String txnid = '123456'; //mandatory // this should be unique each time
const String custacc = '0'; //mandatory
const String clientcode = "NAVIN"; //mandatory
const String udf9 =
    "testdata1,testdata2,testdata3"; //optional, you can send comma seperated data here
const String mode = 'uat'; //mandatory // change to live for production

const String ttype = "NBFundTransfer";
const String txncurr = "INR";
const String txnscamt = "0";

void handleURLButtonPress(BuildContext context, String responsehashKey) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WebViewContainer(getUrl(), responsehashKey)));
}

getUrl() {
  var payDetails = {};
  payDetails['login'] = login;
  payDetails['pass'] = pass;
  payDetails['prodid'] = prodid;
  payDetails['username'] = username;
  payDetails['amt'] = amt;
  payDetails['mobile'] = mobile;
  payDetails['address'] = address;
  payDetails['email'] = email;
  payDetails['date'] = date;
  payDetails['txnid'] = txnid;
  payDetails['custacc'] = custacc;
  payDetails['requesthashKey'] = requesthashKey;
  payDetails['responsehashKey'] = responsehashKey;
  payDetails['requestencryptionKey'] = requestEncryptionKey;
  payDetails['responseencypritonKey'] = responseDecryptionKey;
  payDetails['clientcode'] = clientcode;
  payDetails['mode'] = mode;
  payDetails['udf9'] = udf9;
  payDetails['ttype'] = ttype;
  payDetails['txncurr'] = txncurr;
  payDetails['txnscamt'] = txnscamt;

  return createPayUrl(payDetails);
}