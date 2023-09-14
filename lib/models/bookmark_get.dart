// To parse this JSON data, do
//
//     final bookmarkGet = bookmarkGetFromJson(jsonString);

import 'package:ouft/models/home.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

BookmarkGet bookmarkGetFromJson(String str) =>
    BookmarkGet.fromJson(json.decode(str));

String bookmarkGetToJson(BookmarkGet data) => json.encode(data.toJson());

class BookmarkGet {
  bool error;
  String message;
  int statusCode;
  List<BookmarkData> data;
  int lastPage;

  BookmarkGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory BookmarkGet.fromJson(Map<String, dynamic> json) => BookmarkGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<BookmarkData>.from(
            json["data"].map((x) => BookmarkData.fromJson(x))),
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

class BookmarkData {
  int id;
  String userId;
  String type;
  OurProduct item;

  BookmarkData({
    required this.id,
    required this.userId,
    required this.type,
    required this.item,
  });

  factory BookmarkData.fromJson(Map<String, dynamic> json) => BookmarkData(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        item: OurProduct.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "item": item.toJson(),
      };
}
