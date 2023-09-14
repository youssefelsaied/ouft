// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool error;
  String message;
  int statusCode;
  List<WelcomeData> data;

  Welcome({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<WelcomeData>.from(
            json["data"].map((x) => WelcomeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WelcomeData {
  int id;
  String title;
  String description;
  String image;

  WelcomeData({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
      };
}
