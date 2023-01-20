import 'dart:convert';
import 'package:crypto/crypto.dart';

// Do not change anything in this file
String createPayUrl(Map data) {
  var signature = createSignature(data);
  var bytes = utf8.encode(data['clientcode']);
  var clientcodeEncoded = base64.encode(bytes);
  var url = "";

  if (data['mode'] == "live") {
    url = "https://www.atomtech.in/atomfluttersdk/AES/initiateAESPay?login=" +
        data['login'] +
        "&pass=" +
        data['pass'] +
        "&ttype=" +
        data['ttype'] +
        "&prodid=" +
        data['prodid'] +
        "&amt=" +
        data['amt'] +
        "&txncurr=" +
        data['txncurr'] +
        "&txnscamt=" +
        data['txnscamt'] +
        "&clientcode=" +
        clientcodeEncoded +
        "=&txnid=" +
        data['txnid'] +
        "&date=" +
        data['date'] +
        "&custacc=" +
        data['custacc'] +
        "&udf1=" +
        data['username'] +
        "&udf2=" +
        data['email'] +
        "&udf3=" +
        data['mobile'] +
        "&udf4=" +
        data['address'] +
        "&udf9=" +
        data['udf9'] +
        "&reqenckey=" +
        data['requestencryptionKey'] +
        "&reqencsaltkey=" +
        data['requestencryptionKey'] +
        "&resenckey=" +
        data['responseencypritonKey'] +
        "&resencsaltkey=" +
        data['responseencypritonKey'] +
        "&payurl=https://payments.atomtech.in/paynetz/epi/fts&ru=https://www.atomtech.in/atomfluttersdk/mobilesdk/param/index&signature=" +
        signature;
  } else {
    url = "https://www.atomtech.in/atomfluttersdk/AES/initiateAESPay?login=" +
        data['login'] +
        "&pass=" +
        data['pass'] +
        "&ttype=" +
        data['ttype'] +
        "&prodid=" +
        data['prodid'] +
        "&amt=" +
        data['amt'] +
        "&txncurr=" +
        data['txncurr'] +
        "&txnscamt=" +
        data['txnscamt'] +
        "&clientcode=" +
        clientcodeEncoded +
        "=&txnid=" +
        data['txnid'] +
        "&date=" +
        data['date'] +
        "&custacc=" +
        data['custacc'] +
        "&udf1=" +
        data['username'] +
        "&udf2=" +
        data['email'] +
        "&udf3=" +
        data['mobile'] +
        "&udf4=" +
        data['address'] +
        "&udf9=" +
        data['udf9'] +
        "&reqenckey=" +
        data['requestencryptionKey'] +
        "&reqencsaltkey=" +
        data['requestencryptionKey'] +
        "&resenckey=" +
        data['responseencypritonKey'] +
        "&resencsaltkey=" +
        data['responseencypritonKey'] +
        "&payurl=https://paynetzuat.atomtech.in/paynetz/epi/fts&ru=https://www.atomtech.in/atomfluttersdk/mobilesdk/param/index&signature=" +
        signature;
  }
  return (url);
}

createSignature(Map data) {
  String signatureString = data['login'] +
      data['pass'] +
      data['ttype'] +
      data['prodid'] +
      data['txnid'] +
      data['amt'] +
      data['txncurr'];
  var bytes = utf8.encode(signatureString);
  var key = utf8.encode(data['requesthashKey']);
  var hmacSha512 = Hmac(sha512, key); // HMAC-SHA256
  var digest = hmacSha512.convert(bytes);
  return (digest.toString());
}

validateSignature(Map data, resHashKey) {
  var fCode = data['f_code'];
  String signatureString = data['mmp_txn'] +
      data['mer_txn'] +
      fCode +
      data['prod'] +
      data['discriminator'] +
      data['amt'] +
      data['bank_txn'];
  var bytes = utf8.encode(signatureString);
  var key = utf8.encode(resHashKey);
  var hmacSha512 = Hmac(sha512, key); // HMAC-SHA256
  var digest = hmacSha512.convert(bytes);
  var genSig = digest.toString();
  if (data['signature'] == genSig) {
    return true;
  } else {
    return false;
  }
}
