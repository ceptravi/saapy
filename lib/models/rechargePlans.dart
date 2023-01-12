import 'dart:convert';

RechargePlans? mobilePlansFromJson(String str) =>
    RechargePlans.fromJson(json.decode(str));

String mobilePlansToJson(RechargePlans? data) => json.encode(data!.toJson());

class RechargePlans {
  RechargePlans({
    this.data,
    this.api,
    this.message,
  });

  List<Datum?>? data;
  String? api;
  String? message;

  factory RechargePlans.fromJson(Map<String, dynamic> json) => RechargePlans(
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.rs,
    this.desc,
  });

  int? rs;
  String? desc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rs: json["rs"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "rs": rs,
        "desc": desc,
      };
}
