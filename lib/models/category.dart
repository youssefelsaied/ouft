// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  bool error;
  String message;
  int statusCode;
  List<CategoryData> data;
  int lastPage;

  Category({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CategoryData>.from(
            json["data"].map((x) => CategoryData.fromJson(x))),
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

class CategoryData {
  int id;
  String title;
  String image;

  CategoryData({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
