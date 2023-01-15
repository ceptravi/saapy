// ignore_for_file: file_names

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

class MyUser {
  LoginData? data;
  int? status;
  String? message;
  String? token;

  MyUser({this.data, this.status, this.message, this.token});

  MyUser.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}

class LoginData {
  int? id;
  String? password;
  dynamic lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? deletedEmail;
  String? deletedUsername;
  bool? isStaff;
  bool? isActive;
  bool? isBlocked;
  bool? isDelete;
  String? dateJoined;
  String? fcmToken;

  LoginData(
      {this.id,
      this.password,
      this.lastLogin,
      this.isSuperuser,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.deletedEmail,
      this.deletedUsername,
      this.isStaff,
      this.isActive,
      this.isBlocked,
      this.isDelete,
      this.dateJoined,
      this.fcmToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'] != "null" ? json['last_name'] : "";
    email = json['email'];
    deletedEmail = json['deleted_email'];
    deletedUsername = json['deleted_username'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    isBlocked = json['is_blocked'];
    isDelete = json['is_delete'];
    dateJoined = json['date_joined'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['password'] = password;
    data['last_login'] = lastLogin;
    data['is_superuser'] = isSuperuser;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['deleted_email'] = deletedEmail;
    data['deleted_username'] = deletedUsername;
    data['is_staff'] = isStaff;
    data['is_active'] = isActive;
    data['is_blocked'] = isBlocked;
    data['is_delete'] = isDelete;
    data['date_joined'] = dateJoined;
    data['fcm_token'] = fcmToken;
    return data;
  }
}

class UserInfo {
  UserData? data;
  String? message;

  UserInfo({this.data, this.message});

  UserInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class UserData {
  int? userId;
  String? name;
  String? email;
  String? walletBalance;
  String? image;
  dynamic qrcode;
  String? address;
  String? dob;
  String? phone;
  String? referral;
  String? gender;

  UserData(
      {this.userId,
      this.name,
      this.email,
      this.walletBalance,
      this.image,
      this.qrcode,
      this.address,
      this.dob,
      this.phone,
      this.referral,
      this.gender});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    walletBalance = json['wallet_balance'];
    image = json['image'];
    qrcode = json['qrcode'] ?? "";
    address = json['address'];
    dob = json['dob'];
    phone = json['phone'];
    referral = json['referral'];
    gender = json['gender'] ?? "Other";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['wallet_balance'] = walletBalance;
    data['image'] = image;
    data['qrcode'] = qrcode;
    data['address'] = address;
    data['dob'] = dob;
    data['phone'] = phone;
    data['referral'] = referral;
    data['gender'] = gender;
    return data;
  }
}

class ResendOtp {
  ResendOtpData? data;
  String? message;

  ResendOtp({this.data, this.message});

  ResendOtp.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ResendOtpData.fromJson(json['data']) : null;
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

class ResendOtpData {
  String? type;
  int? userId;
  String? otp;

  ResendOtpData({this.type, this.userId, this.otp});

  ResendOtpData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    userId = json['user_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    return data;
  }
}

UpdateUser? updateUserFromJson(String str) =>
    UpdateUser.fromJson(json.decode(str));

String updateUserToJson(UpdateUser? data) => json.encode(data!.toJson());

class UpdateUser {
  UpdateUser({
    this.data,
    this.message,
  });

  UpdateUserData? data;
  String? message;

  factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
        data: UpdateUserData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class UpdateUserData {
  UpdateUserData({
    this.userId,
    this.name,
    this.email,
    this.walletBalance,
    this.image,
    this.qrcode,
    this.address,
    this.dob,
    this.phone,
  });

  int? userId;
  String? name;
  String? email;
  String? walletBalance;
  dynamic image;
  dynamic qrcode;
  String? address;
  DateTime? dob;
  String? phone;

  factory UpdateUserData.fromJson(Map<String, dynamic> json) => UpdateUserData(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        walletBalance: json["wallet_balance"],
        image: json["image"],
        qrcode: json["qrcode"],
        address: json["address"],
        dob: DateTime.parse(json["dob"]),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "wallet_balance": walletBalance,
        "image": image,
        "qrcode": qrcode,
        "address": address,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "phone": phone,
      };
}
