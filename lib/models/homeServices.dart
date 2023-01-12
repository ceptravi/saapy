import 'dart:convert';

Services? servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services? data) => json.encode(data!.toJson());

class Services {
  Services({
    this.data,
  });

  List<Datum?>? data;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.code,
    this.isPrepaid,
    this.service,
    this.isActive,
    this.createdAt,
    this.moduleId,
    this.icon,
    this.displayName,
    this.apiId,
    this.masterApi,
  });

  int? id;
  String? name;
  String? code;
  bool? isPrepaid;
  String? service;
  bool? isActive;
  dynamic createdAt;
  int? moduleId;
  String? icon;
  String? displayName;
  int? apiId;
  MasterApi? masterApi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        isPrepaid: json["is_prepaid"],
        service: json["service"],
        isActive: json["is_active"],
        createdAt: json["created_at"],
        moduleId: json["module_id"],
        icon: json["icon"],
        displayName: json["display_name"],
        apiId: json["api_id"],
        masterApi: MasterApi.fromJson(json["MasterApi"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "is_prepaid": isPrepaid,
        "service": service,
        "is_active": isActive,
        "created_at": createdAt,
        "module_id": moduleId,
        "icon": icon,
        "display_name": displayName,
        "api_id": apiId,
        "MasterApi": masterApi!.toJson(),
      };
}

class MasterApi {
  MasterApi({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory MasterApi.fromJson(Map<String, dynamic> json) => MasterApi(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
