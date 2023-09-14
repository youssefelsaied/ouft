// To parse this JSON data, do
//
//     final sectionShow = sectionShowFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SectionShow sectionShowFromJson(String str) =>
    SectionShow.fromJson(json.decode(str));

String sectionShowToJson(SectionShow data) => json.encode(data.toJson());

class SectionShow {
  bool error;
  String message;
  int statusCode;
  SectionShowData data;

  SectionShow({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory SectionShow.fromJson(Map<String, dynamic> json) => SectionShow(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: SectionShowData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class SectionShowData {
  int id;
  String title;
  String image;
  List<Service> services;

  SectionShowData({
    required this.id,
    required this.title,
    required this.image,
    required this.services,
  });

  factory SectionShowData.fromJson(Map<String, dynamic> json) =>
      SectionShowData(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Service {
  int id;
  int itemId;
  String name;
  String image;
  int price;
  int finalPrice;
  int discount;
  int rating;
  bool bookmark;

  Service({
    required this.id,
    required this.itemId,
    required this.name,
    required this.image,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.rating,
    required this.bookmark,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        itemId: json["item_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        finalPrice: json["final_price"],
        discount: json["discount"],
        rating: json["rating"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "name": name,
        "image": image,
        "price": price,
        "final_price": finalPrice,
        "discount": discount,
        "rating": rating,
        "bookmark": bookmark,
      };
}
