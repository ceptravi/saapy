import 'dart:convert';

/***************ADD MONEY */
AddMoney? addMoneyFromJson(String str) => AddMoney.fromJson(json.decode(str));

String addMoneyToJson(AddMoney? data) => json.encode(data!.toJson());

class AddMoney {
  AddMoney({
    this.data,
    this.message,
  });

  AddMoneyData? data;
  String? message;

  factory AddMoney.fromJson(Map<String, dynamic> json) => AddMoney(
        data: AddMoneyData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class AddMoneyData {
  AddMoneyData({
    this.id,
    this.amount,
    this.orderid,
    this.module,
    this.txnid,
  });

  int? id;
  int? amount;
  int? orderid;
  String? module;
  String? txnid;

  factory AddMoneyData.fromJson(Map<String, dynamic> json) => AddMoneyData(
        id: json["id"],
        amount: json["amount"],
        orderid: json["orderid"],
        module: json["module"],
        txnid: json["txnid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "orderid": orderid,
        "module": module,
        "txnid": txnid,
      };
}
/*******************PASSBOOK */

MyPassbook? passbookFromJson(String str) =>
    MyPassbook.fromJson(json.decode(str));

String passbookToJson(MyPassbook? data) => json.encode(data!.toJson());

class MyPassbook {
  MyPassbook({
    this.data,
    this.message,
  });

  PassbookData? data;
  String? message;

  factory MyPassbook.fromJson(Map<String, dynamic> json) => MyPassbook(
        data: PassbookData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class PassbookData {
  PassbookData({
    this.balance,
    this.all,
    this.received,
    this.paid,
    this.added,
    this.recharge,
    this.moneytransfer,
  });

  String? balance;
  List<Added?>? all;
  List<dynamic>? received;
  List<Added?>? paid;
  List<Added?>? added;
  List<dynamic>? recharge;
  List<Added?>? moneytransfer;

  factory PassbookData.fromJson(Map<String, dynamic> json) => PassbookData(
        balance: json["Balance"],
        all: json["All"] == null
            ? []
            : List<Added?>.from(json["All"]!.map((x) => Added.fromJson(x))),
        received: json["Received"] == null
            ? []
            : List<dynamic>.from(json["Received"]!.map((x) => x)),
        paid: json["Paid"] == null
            ? []
            : List<Added?>.from(json["Paid"]!.map((x) => Added.fromJson(x))),
        added: json["Added"] == null
            ? []
            : List<Added?>.from(json["Added"]!.map((x) => Added.fromJson(x))),
        recharge: json["Recharge"] == null
            ? []
            : List<dynamic>.from(json["Recharge"]!.map((x) => x)),
        moneytransfer: json["Moneytransfer"] == null
            ? []
            : List<Added?>.from(
                json["Moneytransfer"]!.map((x) => Added.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Balance": balance,
        "All":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x!.toJson())),
        "Received":
            received == null ? [] : List<dynamic>.from(received!.map((x) => x)),
        "Paid": paid == null
            ? []
            : List<dynamic>.from(paid!.map((x) => x!.toJson())),
        "Added": added == null
            ? []
            : List<dynamic>.from(added!.map((x) => x!.toJson())),
        "Recharge":
            recharge == null ? [] : List<dynamic>.from(recharge!.map((x) => x)),
        "Moneytransfer": moneytransfer == null
            ? []
            : List<dynamic>.from(moneytransfer!.map((x) => x!.toJson())),
      };
}

class Added {
  Added({
    this.id,
    this.txnid,
    this.orderid,
    this.tableid,
    this.isCredited,
    this.message,
    this.amount,
    this.paymentDate,
    this.createdAt,
    this.moduleId,
    this.paymentStatusId,
    this.rechargeStatusId,
    this.userId,
    this.paymentModeId,
    this.closingBalance,
    this.isMain,
    this.details,
    this.charges,
    this.recharge,
    this.comments,
    this.remarks,
    this.providerId,
    this.appVersion,
    this.browser,
    this.ipaddress,
    this.rechargeProvider,
    this.masterModule,
    this.masterPaymentmode,
  });

  int? id;
  String? txnid;
  String? orderid;
  String? tableid;
  bool? isCredited;
  String? message;
  String? amount;
  DateTime? paymentDate;
  DateTime? createdAt;
  int? moduleId;
  int? paymentStatusId;
  int? rechargeStatusId;
  int? userId;
  int? paymentModeId;
  String? closingBalance;
  bool? isMain;
  dynamic details;
  String? charges;
  String? recharge;
  dynamic comments;
  dynamic remarks;
  dynamic providerId;
  String? appVersion;
  String? browser;
  String? ipaddress;
  dynamic rechargeProvider;
  MasterModule? masterModule;
  MasterPaymentmode? masterPaymentmode;

  factory Added.fromJson(Map<String, dynamic> json) => Added(
        id: json["id"],
        txnid: json["txnid"],
        orderid: json["orderid"],
        tableid: json["tableid"],
        isCredited: json["is_credited"],
        message: json["message"],
        amount: json["amount"],
        paymentDate: DateTime.parse(json["payment_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        moduleId: json["module_id"],
        paymentStatusId: json["payment_status_id"],
        rechargeStatusId: json["recharge_status_id"],
        userId: json["user_id"],
        paymentModeId: json["payment_mode_id"],
        closingBalance: json["closing_balance"],
        isMain: json["is_main"],
        details: json["details"],
        charges: json["charges"],
        recharge: json["recharge"],
        comments: json["comments"],
        remarks: json["remarks"],
        providerId: json["provider_id"],
        appVersion: json["app_version"],
        browser: json["browser"],
        ipaddress: json["ipaddress"],
        rechargeProvider: json["RechargeProvider"],
        masterModule: MasterModule.fromJson(json["MasterModule"]),
        masterPaymentmode:
            MasterPaymentmode.fromJson(json["MasterPaymentmode"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "txnid": txnid,
        "orderid": orderid,
        "tableid": tableid,
        "is_credited": isCredited,
        "message": message,
        "amount": amount,
        "payment_date": paymentDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "module_id": moduleId,
        "payment_status_id": paymentStatusId,
        "recharge_status_id": rechargeStatusId,
        "user_id": userId,
        "payment_mode_id": paymentModeId,
        "closing_balance": closingBalance,
        "is_main": isMain,
        "details": details,
        "charges": charges,
        "recharge": recharge,
        "comments": comments,
        "remarks": remarks,
        "provider_id": providerId,
        "app_version": appVersion,
        "browser": browser,
        "ipaddress": ipaddress,
        "RechargeProvider": rechargeProvider,
        "MasterModule": masterModule!.toJson(),
        "MasterPaymentmode": masterPaymentmode!.toJson(),
      };
}

class MasterModule {
  MasterModule({
    this.id,
    this.title,
    this.status,
    this.categoryId,
    this.displayname,
  });

  int? id;
  String? title;
  bool? status;
  dynamic categoryId;
  dynamic displayname;

  factory MasterModule.fromJson(Map<String, dynamic> json) => MasterModule(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        categoryId: json["category_id"],
        displayname: json["displayname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "category_id": categoryId,
        "displayname": displayname,
      };
}

class MasterPaymentmode {
  MasterPaymentmode({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory MasterPaymentmode.fromJson(Map<String, dynamic> json) =>
      MasterPaymentmode(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
