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

AddMoneyStatus? addMoneyStatusFromJson(String str) =>
    AddMoneyStatus.fromJson(json.decode(str));

String addMoneyStatusToJson(AddMoneyStatus? data) =>
    json.encode(data!.toJson());

class AddMoneyStatus {
  AddMoneyStatus({
    this.data,
    this.isScratch,
    this.message,
  });

  AddMoneyStatusData? data;
  int? isScratch;
  String? message;

  factory AddMoneyStatus.fromJson(Map<String, dynamic> json) => AddMoneyStatus(
        data: AddMoneyStatusData.fromJson(json["data"]),
        isScratch: json["is_scratch"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "is_scratch": isScratch,
        "message": message,
      };
}

class AddMoneyStatusData {
  AddMoneyStatusData({
    this.id,
    this.txnid,
    this.orderid,
    this.amount,
    this.paymentResponse,
    this.paymentDate,
    this.description,
    this.message,
    this.paymentModeId,
    this.paymentStatusId,
    this.userId,
    this.couponId,
    this.couponAmount,
    this.charges,
    this.recharge,
  });

  int? id;
  String? txnid;
  String? orderid;
  String? amount;
  String? paymentResponse;
  DateTime? paymentDate;
  String? description;
  String? message;
  int? paymentModeId;
  int? paymentStatusId;
  int? userId;
  dynamic couponId;
  dynamic couponAmount;
  String? charges;
  String? recharge;

  factory AddMoneyStatusData.fromJson(Map<String, dynamic> json) =>
      AddMoneyStatusData(
        id: json["id"],
        txnid: json["txnid"],
        orderid: json["orderid"],
        amount: json["amount"],
        paymentResponse: json["payment_response"],
        paymentDate: DateTime.parse(json["payment_date"]),
        description: json["description"],
        message: json["message"],
        paymentModeId: json["payment_mode_id"],
        paymentStatusId: json["payment_status_id"],
        userId: json["user_id"],
        couponId: json["coupon_id"],
        couponAmount: json["coupon_amount"],
        charges: json["charges"],
        recharge: json["recharge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "txnid": txnid,
        "orderid": orderid,
        "amount": amount,
        "payment_response": paymentResponse,
        "payment_date": paymentDate?.toIso8601String(),
        "description": description,
        "message": message,
        "payment_mode_id": paymentModeId,
        "payment_status_id": paymentStatusId,
        "user_id": userId,
        "coupon_id": couponId,
        "coupon_amount": couponAmount,
        "charges": charges,
        "recharge": recharge,
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

/****************PAY to Wallet */
PayToWallet? payToWalletFromJson(String str) =>
    PayToWallet.fromJson(json.decode(str));

String payToWalletToJson(PayToWallet? data) => json.encode(data!.toJson());

class PayToWallet {
  PayToWallet({
    this.data,
    this.message,
  });

  PayToWalletData? data;
  String? message;

  factory PayToWallet.fromJson(Map<String, dynamic> json) => PayToWallet(
        data: PayToWalletData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class PayToWalletData {
  PayToWalletData({
    this.id,
    this.amount,
    this.orderid,
    this.paymentstatus,
    this.module,
    this.txnid,
  });

  int? id;
  int? amount;
  int? orderid;
  int? paymentstatus;
  String? module;
  String? txnid;

  factory PayToWalletData.fromJson(Map<String, dynamic> json) =>
      PayToWalletData(
        id: json["id"],
        amount: json["amount"],
        orderid: json["orderid"],
        paymentstatus: json["paymentstatus"],
        module: json["module"],
        txnid: json["txnid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "orderid": orderid,
        "paymentstatus": paymentstatus,
        "module": module,
        "txnid": txnid,
      };
}

/**********************Payment Wallet STatus */
WalletPaymentStatus? walletPaymentStatusFromJson(String str) =>
    WalletPaymentStatus.fromJson(json.decode(str));

String walletPaymentStatusToJson(WalletPaymentStatus? data) =>
    json.encode(data!.toJson());

class WalletPaymentStatus {
  WalletPaymentStatus({
    this.data,
    this.isScratch,
    this.message,
  });

  WalletPaymentStatusData? data;
  int? isScratch;
  String? message;

  factory WalletPaymentStatus.fromJson(Map<String, dynamic> json) =>
      WalletPaymentStatus(
        data: WalletPaymentStatusData.fromJson(json["data"]),
        isScratch: json["is_scratch"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "is_scratch": isScratch,
        "message": message,
      };
}

class WalletPaymentStatusData {
  WalletPaymentStatusData({
    this.txnid,
    this.orderid,
    this.status,
  });

  String? txnid;
  String? orderid;
  String? status;

  factory WalletPaymentStatusData.fromJson(Map<String, dynamic> json) =>
      WalletPaymentStatusData(
        txnid: json["txnid"],
        orderid: json["orderid"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "txnid": txnid,
        "orderid": orderid,
        "status": status,
      };
}

KycTypes? kycTypesFromJson(String str) => KycTypes.fromJson(json.decode(str));

String kycTypesToJson(KycTypes? data) => json.encode(data!.toJson());

class KycTypes {
  KycTypes({
    this.data,
    this.message,
  });

  List<KycTypesData?>? data;
  String? message;

  factory KycTypes.fromJson(Map<String, dynamic> json) => KycTypes(
        data: json["data"] == null
            ? []
            : List<KycTypesData?>.from(
                json["data"]!.map((x) => KycTypesData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "message": message,
      };
}

class KycTypesData {
  KycTypesData({
    this.id,
    this.title,
    this.isActive,
    this.createdAt,
  });

  int? id;
  String? title;
  bool? isActive;
  String? createdAt;

  factory KycTypesData.fromJson(Map<String, dynamic> json) => KycTypesData(
        id: json["id"],
        title: json["title"],
        isActive: json["is_active"],
        createdAt: json["created_at"] != null ? json["created_at"] : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_active": isActive,
        "created_at": createdAt,
      };
}

MyScratchCards? myScratchCardsFromJson(String str) =>
    MyScratchCards.fromJson(json.decode(str));

String myScratchCardsToJson(MyScratchCards? data) =>
    json.encode(data!.toJson());

class MyScratchCards {
  MyScratchCards({
    this.data,
    this.message,
  });

  MyScratchCardsData? data;
  String? message;

  factory MyScratchCards.fromJson(Map<String, dynamic> json) => MyScratchCards(
        data: MyScratchCardsData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class MyScratchCardsData {
  MyScratchCardsData({
    this.scratchCard,
    this.scratchAmount,
    this.notScratchAmount,
  });

  List<ScratchCard?>? scratchCard;
  int? scratchAmount;
  int? notScratchAmount;

  factory MyScratchCardsData.fromJson(Map<String, dynamic> json) =>
      MyScratchCardsData(
        scratchCard: json["scratch_card"] == null
            ? []
            : List<ScratchCard?>.from(
                json["scratch_card"]!.map((x) => ScratchCard.fromJson(x))),
        scratchAmount: json["scratch_amount"],
        notScratchAmount: json["not_scratch_amount"],
      );

  Map<String, dynamic> toJson() => {
        "scratch_card": scratchCard == null
            ? []
            : List<dynamic>.from(scratchCard!.map((x) => x!.toJson())),
        "scratch_amount": scratchAmount,
        "not_scratch_amount": notScratchAmount,
      };
}

class ScratchCard {
  ScratchCard({
    this.id,
    this.scratchCardCode,
    this.amount,
    this.isScratched,
    this.createdAt,
    this.passbookId,
    this.scratchcardId,
    this.userId,
  });

  int? id;
  String? scratchCardCode;
  String? amount;
  bool? isScratched;
  DateTime? createdAt;
  int? passbookId;
  int? scratchcardId;
  int? userId;

  factory ScratchCard.fromJson(Map<String, dynamic> json) => ScratchCard(
        id: json["id"],
        scratchCardCode: json["scratch_card_code"],
        amount: json["amount"],
        isScratched: json["is_scratched"],
        createdAt: DateTime.parse(json["created_at"]),
        passbookId: json["passbook_id"],
        scratchcardId: json["scratchcard_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scratch_card_code": scratchCardCode,
        "amount": amount,
        "is_scratched": isScratched,
        "created_at": createdAt?.toIso8601String(),
        "passbook_id": passbookId,
        "scratchcard_id": scratchcardId,
        "user_id": userId,
      };
}

CardCleared? cardClearedFromJson(String str) =>
    CardCleared.fromJson(json.decode(str));

String cardClearedToJson(CardCleared? data) => json.encode(data!.toJson());

class CardCleared {
  CardCleared({
    this.data,
    this.amount,
    this.message,
  });

  CardClearedData? data;
  String? amount;
  String? message;

  factory CardCleared.fromJson(Map<String, dynamic> json) => CardCleared(
        data: CardClearedData.fromJson(json["data"]),
        amount: json["amount"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "amount": amount,
        "message": message,
      };
}

class CardClearedData {
  CardClearedData({
    this.id,
    this.scratchCardCode,
    this.amount,
    this.isScratched,
    this.createdAt,
    this.passbookId,
    this.scratchcardId,
    this.userId,
  });

  int? id;
  String? scratchCardCode;
  String? amount;
  bool? isScratched;
  DateTime? createdAt;
  int? passbookId;
  int? scratchcardId;
  int? userId;

  factory CardClearedData.fromJson(Map<String, dynamic> json) =>
      CardClearedData(
        id: json["id"],
        scratchCardCode: json["scratch_card_code"],
        amount: json["amount"],
        isScratched: json["is_scratched"],
        createdAt: DateTime.parse(json["created_at"]),
        passbookId: json["passbook_id"],
        scratchcardId: json["scratchcard_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scratch_card_code": scratchCardCode,
        "amount": amount,
        "is_scratched": isScratched,
        "created_at": createdAt?.toIso8601String(),
        "passbook_id": passbookId,
        "scratchcard_id": scratchcardId,
        "user_id": userId,
      };
}

MybeneficiersDetails? mybeneficiersDetailsFromJson(String str) =>
    MybeneficiersDetails.fromJson(json.decode(str));

String mybeneficiersDetailsToJson(MybeneficiersDetails? data) =>
    json.encode(data!.toJson());

class MybeneficiersDetails {
  MybeneficiersDetails({
    this.data,
  });

  List<MybeneficiersDetailsData?>? data;

  factory MybeneficiersDetails.fromJson(Map<String, dynamic> json) =>
      MybeneficiersDetails(
        data: json["data"] == null
            ? []
            : List<MybeneficiersDetailsData?>.from(
                json["data"]!.map((x) => MybeneficiersDetailsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class MybeneficiersDetailsData {
  MybeneficiersDetailsData({
    this.id,
    this.beneName,
    this.beneAccountNumber,
    this.validatedAt,
    this.createdAt,
    this.apiId,
    this.userId,
    this.amazonNumber,
    this.bankName,
    this.ifsc,
    this.isActive,
    this.paytmNumber,
    this.upi,
    this.mobilenumber,
  });

  int? id;
  String? beneName;
  String? beneAccountNumber;
  dynamic validatedAt;
  DateTime? createdAt;
  int? apiId;
  int? userId;
  String? amazonNumber;
  dynamic bankName;
  String? ifsc;
  bool? isActive;
  String? paytmNumber;
  String? upi;
  String? mobilenumber;

  factory MybeneficiersDetailsData.fromJson(Map<String, dynamic> json) =>
      MybeneficiersDetailsData(
        id: json["id"],
        beneName: json["beneName"],
        beneAccountNumber: json["beneAccountNumber"],
        validatedAt: json["validated_at"],
        createdAt: DateTime.parse(json["created_at"]),
        apiId: json["api_id"],
        userId: json["user_id"],
        amazonNumber: json["amazonNumber"],
        bankName: json["bankName"],
        ifsc: json["ifsc"],
        isActive: json["is_active"],
        paytmNumber: json["paytmNumber"],
        upi: json["upi"],
        mobilenumber: json["mobilenumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "beneName": beneName,
        "beneAccountNumber": beneAccountNumber,
        "validated_at": validatedAt,
        "created_at": createdAt?.toIso8601String(),
        "api_id": apiId,
        "user_id": userId,
        "amazonNumber": amazonNumber,
        "bankName": bankName,
        "ifsc": ifsc,
        "is_active": isActive,
        "paytmNumber": paytmNumber,
        "upi": upi,
        "mobilenumber": mobilenumber,
      };
}

AddbeneficiersDetails? addbeneficiersDetailsFromJson(String str) =>
    AddbeneficiersDetails.fromJson(json.decode(str));

String addbeneficiersDetailsToJson(AddbeneficiersDetails? data) =>
    json.encode(data!.toJson());

class AddbeneficiersDetails {
  AddbeneficiersDetails({
    this.data,
    this.message,
  });

  AddbeneficiersDetailsData? data;
  String? message;

  factory AddbeneficiersDetails.fromJson(Map<String, dynamic> json) =>
      AddbeneficiersDetails(
        data: AddbeneficiersDetailsData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class AddbeneficiersDetailsData {
  AddbeneficiersDetailsData({
    this.id,
    this.beneName,
    this.createdAt,
    this.apiId,
    this.userId,
    this.isActive,
    this.beneAccountNumber,
    this.ifsc,
    this.upi,
    this.paytmNumber,
    this.amazonNumber,
    this.mobilenumber,
  });

  int? id;
  String? beneName;
  DateTime? createdAt;
  int? apiId;
  int? userId;
  bool? isActive;
  String? beneAccountNumber;
  String? ifsc;
  String? upi;
  String? paytmNumber;
  String? amazonNumber;
  String? mobilenumber;

  factory AddbeneficiersDetailsData.fromJson(Map<String, dynamic> json) =>
      AddbeneficiersDetailsData(
        id: json["id"],
        beneName: json["beneName"],
        createdAt: DateTime.parse(json["created_at"]),
        apiId: json["api_id"],
        userId: json["user_id"],
        isActive: json["is_active"],
        beneAccountNumber: json["beneAccountNumber"],
        ifsc: json["ifsc"],
        upi: json["upi"],
        paytmNumber: json["paytmNumber"],
        amazonNumber: json["amazonNumber"],
        mobilenumber: json["mobilenumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "beneName": beneName,
        "created_at": createdAt?.toIso8601String(),
        "api_id": apiId,
        "user_id": userId,
        "is_active": isActive,
        "beneAccountNumber": beneAccountNumber,
        "ifsc": ifsc,
        "upi": upi,
        "paytmNumber": paytmNumber,
        "amazonNumber": amazonNumber,
        "mobilenumber": mobilenumber,
      };
}

UpdatebeneficiersDetails? updatebeneficiersDetailsFromJson(String str) =>
    UpdatebeneficiersDetails.fromJson(json.decode(str));

String updatebeneficiersDetailsToJson(UpdatebeneficiersDetails? data) =>
    json.encode(data!.toJson());

class UpdatebeneficiersDetails {
  UpdatebeneficiersDetails({
    this.data,
    this.message,
  });

  List<int?>? data;
  String? message;

  factory UpdatebeneficiersDetails.fromJson(Map<String, dynamic> json) =>
      UpdatebeneficiersDetails(
        data: json["data"] == null
            ? []
            : List<int?>.from(json["data"]!.map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "message": message,
      };
}

DeleteBeneficierAccount? deleteBeneficierAccountFromJson(String str) =>
    DeleteBeneficierAccount.fromJson(json.decode(str));

String deleteBeneficierAccountToJson(DeleteBeneficierAccount? data) =>
    json.encode(data!.toJson());

class DeleteBeneficierAccount {
  DeleteBeneficierAccount({
    this.data,
    this.message,
  });

  int? data;
  String? message;

  factory DeleteBeneficierAccount.fromJson(Map<String, dynamic> json) =>
      DeleteBeneficierAccount(
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}

class MyBankDetails {
  List<MyBankDetailsData>? data;

  MyBankDetails({this.data});

  MyBankDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MyBankDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new MyBankDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyBankDetailsData {
  int? id;
  String? beneName;
  String? beneAccountNumber;
  String? validatedAt;
  String? createdAt;
  int? apiId;
  int? userId;
  String? amazonNumber;
  String? bankName;
  String? ifsc;
  bool? isActive;
  String? paytmNumber;
  String? upi;
  String? mobilenumber;

  MyBankDetailsData(
      {this.id,
      this.beneName,
      this.beneAccountNumber,
      this.validatedAt,
      this.createdAt,
      this.apiId,
      this.userId,
      this.amazonNumber,
      this.bankName,
      this.ifsc,
      this.isActive,
      this.paytmNumber,
      this.upi,
      this.mobilenumber});

  MyBankDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneName = json['beneName'];
    beneAccountNumber = json['beneAccountNumber'];
    validatedAt = json['validated_at'];
    createdAt = json['created_at'];
    apiId = json['api_id'];
    userId = json['user_id'];
    amazonNumber = json['amazonNumber'];
    bankName = json['bankName'];
    ifsc = json['ifsc'];
    isActive = json['is_active'];
    paytmNumber = json['paytmNumber'];
    upi = json['upi'];
    mobilenumber = json['mobilenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['beneName'] = this.beneName;
    data['beneAccountNumber'] = this.beneAccountNumber;
    data['validated_at'] = this.validatedAt;
    data['created_at'] = this.createdAt;
    data['api_id'] = this.apiId;
    data['user_id'] = this.userId;
    data['amazonNumber'] = this.amazonNumber;
    data['bankName'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['is_active'] = this.isActive;
    data['paytmNumber'] = this.paytmNumber;
    data['upi'] = this.upi;
    data['mobilenumber'] = this.mobilenumber;
    return data;
  }
}

class AddBankDetails {
  AddBankData? data;
  String? message;

  AddBankDetails({this.data, this.message});

  AddBankDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new AddBankData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class AddBankData {
  int? id;
  String? beneName;
  String? createdAt;
  int? apiId;
  int? userId;
  bool? isActive;
  String? beneAccountNumber;
  String? ifsc;
  String? upi;
  String? paytmNumber;
  String? amazonNumber;
  String? mobilenumber;

  AddBankData(
      {this.id,
      this.beneName,
      this.createdAt,
      this.apiId,
      this.userId,
      this.isActive,
      this.beneAccountNumber,
      this.ifsc,
      this.upi,
      this.paytmNumber,
      this.amazonNumber,
      this.mobilenumber});

  AddBankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneName = json['beneName'];
    createdAt = json['created_at'];
    apiId = json['api_id'];
    userId = json['user_id'];
    isActive = json['is_active'];
    beneAccountNumber = json['beneAccountNumber'];
    ifsc = json['ifsc'];
    upi = json['upi'];
    paytmNumber = json['paytmNumber'];
    amazonNumber = json['amazonNumber'];
    mobilenumber = json['mobilenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['beneName'] = this.beneName;
    data['created_at'] = this.createdAt;
    data['api_id'] = this.apiId;
    data['user_id'] = this.userId;
    data['is_active'] = this.isActive;
    data['beneAccountNumber'] = this.beneAccountNumber;
    data['ifsc'] = this.ifsc;
    data['upi'] = this.upi;
    data['paytmNumber'] = this.paytmNumber;
    data['amazonNumber'] = this.amazonNumber;
    data['mobilenumber'] = this.mobilenumber;
    return data;
  }
}
