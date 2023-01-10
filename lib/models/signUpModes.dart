import 'dart:convert';

Register? registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register? data) => json.encode(data!.toJson());

class Register {
  Register({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.type,
    this.userId,
    this.otp,
  });

  String? type;
  int? userId;
  String? otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        userId: json["user_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "user_id": userId,
        "otp": otp,
      };
}
