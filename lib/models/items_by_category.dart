// To parse this JSON data, do
//
//     final itemsByCategory = itemsByCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemsByCategory itemsByCategoryFromJson(String str) =>
    ItemsByCategory.fromJson(json.decode(str));

String itemsByCategoryToJson(ItemsByCategory data) =>
    json.encode(data.toJson());

class ItemsByCategory {
  bool error;
  String message;
  int statusCode;
  List<ItemByCategoryData> data;
  int lastPage;

  ItemsByCategory({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory ItemsByCategory.fromJson(Map<String, dynamic> json) =>
      ItemsByCategory(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<ItemByCategoryData>.from(
            json["data"].map((x) => ItemByCategoryData.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class ItemByCategoryData {
  int id;
  String title;
  String address;
  String image;
  int rating;
  bool bookmark;

  ItemByCategoryData({
    required this.id,
    required this.title,
    required this.address,
    required this.image,
    required this.rating,
    required this.bookmark,
  });

  factory ItemByCategoryData.fromJson(Map<String, dynamic> json) =>
      ItemByCategoryData(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        image: json["image"],
        rating: json["rating"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "image": image,
        "rating": rating,
        "bookmark": bookmark,
      };
}
