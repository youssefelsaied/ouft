// To parse this JSON data, do
//
//     final categorySalons = categorySalonsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategorySalons categorySalonsFromJson(String str) =>
    CategorySalons.fromJson(json.decode(str));

String categorySalonsToJson(CategorySalons data) => json.encode(data.toJson());

class CategorySalons {
  bool error;
  String message;
  int statusCode;
  List<CategorySalonData> data;
  int lastPage;

  CategorySalons({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory CategorySalons.fromJson(Map<String, dynamic> json) => CategorySalons(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CategorySalonData>.from(
            json["data"].map((x) => CategorySalonData.fromJson(x))),
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

class CategorySalonData {
  int id;
  String title;
  String address;
  String image;
  int rating;
  bool bookmark;

  CategorySalonData({
    required this.id,
    required this.title,
    required this.address,
    required this.image,
    required this.rating,
    required this.bookmark,
  });

  factory CategorySalonData.fromJson(Map<String, dynamic> json) =>
      CategorySalonData(
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
