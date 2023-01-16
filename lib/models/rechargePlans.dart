import 'dart:convert';

Charges? chargesFromJson(String str) => Charges.fromJson(json.decode(str));

String chargesToJson(Charges? data) => json.encode(data!.toJson());

class Charges {
  Charges({
    this.data,
  });

  ChargesData? data;

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        data: ChargesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ChargesData {
  ChargesData({
    this.charge,
  });

  String? charge;

  factory ChargesData.fromJson(Map<String, dynamic> json) => ChargesData(
        charge: json["charge"],
      );

  Map<String, dynamic> toJson() => {
        "charge": charge,
      };
}

RechargePlans? mobilePlansFromJson(String str) =>
    RechargePlans.fromJson(json.decode(str));

String mobilePlansToJson(RechargePlans? data) => json.encode(data!.toJson());

class RechargePlans {
  RechargePlans({
    this.data,
    this.api,
    this.message,
  });

  List<RechargePlansData?>? data;
  String? api;
  String? message;

  factory RechargePlans.fromJson(Map<String, dynamic> json) => RechargePlans(
        data: json["data"] == null
            ? []
            : List<RechargePlansData?>.from(
                json["data"]!.map((x) => RechargePlansData.fromJson(x))),
        api: json["api"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "api": api,
        "message": message,
      };
}

class RechargePlansData {
  RechargePlansData({
    this.rs,
    this.desc,
  });

  int? rs;
  String? desc;

  factory RechargePlansData.fromJson(Map<String, dynamic> json) =>
      RechargePlansData(
        rs: json["rs"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "rs": rs,
        "desc": desc,
      };
}

/****************CIRCLES JSON */
class Circles {
  Circles({
    this.isCircle,
    this.data,
  });
  int? isCircle;
  List<CirclesData>? data;

  Circles.fromJson(Map<String, dynamic> json) {
    isCircle = json['is_circle'];
    data = List.from(json['data']).map((e) => CirclesData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_circle'] = isCircle;
    _data['data'] = data!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CirclesData {
  CirclesData({
    this.id,
    this.circle,
    this.code,
    this.isActive,
  });
  int? id;
  String? circle;
  String? code;
  bool? isActive;

  CirclesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    circle = json['circle'];
    code = json['code'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['circle'] = circle;
    _data['code'] = code;
    _data['is_active'] = isActive;
    return _data;
  }
}

/************SCRATCH CARDS */
class MyScratchCards {
  MyScratchCards({
    this.data,
    this.message,
  });
  ScratchCardsData? data;
  String? message;

  MyScratchCards.fromJson(Map<String, dynamic> json) {
    data = ScratchCardsData.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.toJson();
    _data['message'] = message;
    return _data;
  }
}

class ScratchCardsData {
  ScratchCardsData({
    this.scratchCard,
    this.scratchAmount,
    this.notScratchAmount,
  });
  List<ScratchCard>? scratchCard;
  int? scratchAmount;
  int? notScratchAmount;

  ScratchCardsData.fromJson(Map<String, dynamic> json) {
    scratchCard = List.from(json['scratch_card'])
        .map((e) => ScratchCard.fromJson(e))
        .toList();
    scratchAmount = json['scratch_amount'];
    notScratchAmount = json['not_scratch_amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scratch_card'] = scratchCard!.map((e) => e.toJson()).toList();
    _data['scratch_amount'] = scratchAmount;
    _data['not_scratch_amount'] = notScratchAmount;
    return _data;
  }
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
  String? createdAt;
  int? passbookId;
  int? scratchcardId;
  int? userId;

  ScratchCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scratchCardCode = json['scratch_card_code'];
    amount = json['amount'];
    isScratched = json['is_scratched'];
    createdAt = json['created_at'];
    passbookId = json['passbook_id'];
    scratchcardId = json['scratchcard_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['scratch_card_code'] = scratchCardCode;
    _data['amount'] = amount;
    _data['is_scratched'] = isScratched;
    _data['created_at'] = createdAt;
    _data['passbook_id'] = passbookId;
    _data['scratchcard_id'] = scratchcardId;
    _data['user_id'] = userId;
    return _data;
  }
}

/****************KYC TYPES */
class KycTypes {
  KycTypes({
    this.data,
    this.message,
  });
  List<KycTypesData>? data;
  String? message;

  KycTypes.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => KycTypesData.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
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

  KycTypesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isActive = json['is_active'];
    createdAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['is_active'] = isActive;
    _data['created_at'] = createdAt;
    return _data;
  }
}

/**************AddPayment */
class AddWalletPayment {
  AddWalletPayment({
    this.data,
    this.message,
  });
  AddPaymentData? data;
  String? message;

  AddWalletPayment.fromJson(Map<String, dynamic> json) {
    data = AddPaymentData.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.toJson();
    _data['message'] = message;
    return _data;
  }
}

class AddPaymentData {
  AddPaymentData({
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

  AddPaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    orderid = json['orderid'];
    module = json['module'];
    txnid = json['txnid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['amount'] = amount;
    _data['orderid'] = orderid;
    _data['module'] = module;
    _data['txnid'] = txnid;
    return _data;
  }
}
