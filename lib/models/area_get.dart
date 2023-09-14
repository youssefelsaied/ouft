// To parse this JSON data, do
//
//     final areaGet = areaGetFromJson(jsonString);

import 'package:ouft/models/city_get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AreaGet areaGetFromJson(String str) => AreaGet.fromJson(json.decode(str));

String areaGetToJson(AreaGet data) => json.encode(data.toJson());

class AreaGet {
  bool error;
  String message;
  int statusCode;
  List<AreaData> data;

  AreaGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory AreaGet.fromJson(Map<String, dynamic> json) => AreaGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data:
            List<AreaData>.from(json["data"].map((x) => AreaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AreaData {
  int id;
  String title;
  String deliveryFee;
  CityData city;

  AreaData({
    required this.id,
    required this.title,
    required this.deliveryFee,
    required this.city,
  });

  factory AreaData.fromJson(Map<String, dynamic> json) => AreaData(
        id: json["id"],
        title: json["title"],
        deliveryFee: json["delivery_fee"],
        city: CityData.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "delivery_fee": deliveryFee,
        "city": city.toJson(),
      };
}
