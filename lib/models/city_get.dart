// To parse this JSON data, do
//
//     final cityGet = cityGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CityGet cityGetFromJson(String str) => CityGet.fromJson(json.decode(str));

String cityGetToJson(CityGet data) => json.encode(data.toJson());

class CityGet {
  bool error;
  String message;
  int statusCode;
  List<CityData> data;

  CityGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory CityGet.fromJson(Map<String, dynamic> json) => CityGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data:
            List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CityData {
  int id;
  String title;

  CityData({
    required this.id,
    required this.title,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
