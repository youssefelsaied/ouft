// To parse this JSON data, do
//
//     final addressGet = addressGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddressGet addressGetFromJson(String str) =>
    AddressGet.fromJson(json.decode(str));

String addressGetToJson(AddressGet data) => json.encode(data.toJson());

class AddressGet {
  bool error;
  String message;
  int statusCode;
  List<AddressGetData> data;

  AddressGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory AddressGet.fromJson(Map<String, dynamic> json) => AddressGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<AddressGetData>.from(
            json["data"].map((x) => AddressGetData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddressGetData {
  int id;
  String fullName;
  String mobile;
  String description;
  Area area;
  City city;

  AddressGetData({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.description,
    required this.area,
    required this.city,
  });

  factory AddressGetData.fromJson(Map<String, dynamic> json) => AddressGetData(
        id: json["id"],
        fullName: json["full_name"],
        mobile: json["mobile"],
        description: json["description"],
        area: Area.fromJson(json["area"]),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "mobile": mobile,
        "description": description,
        "area": area.toJson(),
        "city": city.toJson(),
      };
}

class Area {
  int id;
  String title;
  String deliveryFee;

  Area({
    required this.id,
    required this.title,
    required this.deliveryFee,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        title: json["title"],
        deliveryFee: json["delivery_fee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "delivery_fee": deliveryFee,
      };
}

class City {
  int id;
  String title;

  City({
    required this.id,
    required this.title,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
