// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool error;
  String message;
  int statusCode;
  UserData data;

  User({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class UserData {
  String id;
  String name;
  String email;
  String image;
  String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "token": token,
      };
}
